//
//  BaseTableViewController.m
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RAC(self,dataArr) = RACObserve(self.listViewModel, dataArr);
    
    [RACObserve(self.listViewModel, listDataType) subscribeNext:^(id _Nullable viewModel) {
        switch ([viewModel integerValue]) {
                
            case ListDataTypeOfNoData:
            {
                self.tableView.mj_footer = nil;
            }
                break;
            case ListDataTypeOfHaveData:
            {
                if (self.isRefresh) {
                    self.tableView.mj_header = [[self refreshClass] headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeaderTableView)];
                    
                    if (self.tableView.mj_footer == nil) {
                        self.tableView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterTableView)];
                    }
                }
                
            }
              break;
            case ListDataTypeOfEndRefresh:
            {
                [self.tableView.mj_header endRefreshing];
                if (self.tableView.mj_footer == nil) {
                    self.tableView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterTableView)];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
            }
                break;
                
            case ListDataTypeOfEndUpdate:
            {
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
            }
                break;
                
            case ListDataTypeOfEndUpdateNoMoreData:
            {
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
                break;
                
            default:
                break;
        }
    }];
}



- (void)refreshHeaderTableView{
    
}

- (void)refreshFooterTableView{
    
}



- (instancetype)initWithViewModel:(BaseListViewModel *)viewModel{
    if (self = [super initWithViewModel:viewModel]) {
        self.listViewModel = viewModel;        
    }
    return self;
}


- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = self.view.bounds;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (void)setIsRefresh:(BOOL)isRefresh{
    _isRefresh = isRefresh;
}


- (Class)refreshClass{
    return [MJRefreshNormalHeader class];
}

- (Class)updateClass{
    return [MJRefreshAutoStateFooter class];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

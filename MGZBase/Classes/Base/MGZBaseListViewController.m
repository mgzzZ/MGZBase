//
//  BaseTableViewController.m
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "MGZBaseListViewController.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <MJRefresh/MJRefresh.h>
@interface MGZBaseListViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic,strong)MGZBaseListViewModel *listViewModel;
@end

@implementation MGZBaseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubViews];
    [self getData];
    RAC(self,dataArr) = RACObserve(self.listViewModel, dataArr);
    @weakify(self);
    [[RACObserve(self, dataArr) skip:1] subscribeNext:^(NSMutableArray * _Nullable x) {
        @strongify(self);
        self->_tableView.emptyDataSetSource = self;
        self->_tableView.emptyDataSetDelegate = self;
        if (self.isRefresh) {
            if (x.count == 0) {
                self.listDataType = ListDataTypeOfNoData;
            }else if (x.count % self.listViewModel.pageSize == 0){
                self.listDataType = ListDataTypeOfEndUpdate;
            }else{
                self.listDataType = ListDataTypeOfEndUpdateNoMoreData;
            }
        }
        [self.tableView reloadData];
    }];
}

- (void)layoutSubViews{
    
    self.tableView.frame = self.view.bounds;
    [self.tableView reloadEmptyDataSet];
}

- (void)getData{
    if (self.isRefresh) {
        self.tableView.mj_header = [[self refreshClass] headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeaderTableView)];
        [self.tableView.mj_header beginRefreshing];
    }else{
        [self.listViewModel getData];
    }
}

- (void)refreshHeaderTableView{
    [self.listViewModel refreshData];
}

- (void)refreshFooterTableView{
    [self.listViewModel updateData];
}


- (instancetype)initWithViewModel:(MGZBaseListViewModel *)viewModel{
    if (self = [super init]) {
        _listViewModel = viewModel;
        [self bindViewModel:viewModel];
    }
    return self;
}


- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = @[];
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
        if (self.listViewModel.listConfig.estimatedRowHeight == 0) {
            _tableView.rowHeight = self.listViewModel.listConfig.cellHeight;
        }else{
            _tableView.rowHeight = UITableViewAutomaticDimension;
            _tableView.estimatedRowHeight = self.listViewModel.listConfig.estimatedRowHeight;
        }
        if (self.listViewModel.listConfig.cellClassNameArr.count == 0) {
            [_tableView registerNib:[UINib nibWithNibName:self.listViewModel.listConfig.cellClassName bundle:nil] forCellReuseIdentifier:self.listViewModel.listConfig.cellClassName];
        }else{
            for (NSString *name in self.listViewModel.listConfig.cellClassNameArr) {
                [_tableView registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:name];
            }
        }
        
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.listViewModel.listConfig.cellForRowMoreType) {
        return self.listViewModel.listConfig.cellForRowMoreType(tableView,indexPath);
    }else{
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:self.listViewModel.listConfig.cellClassName];
        if (self.dataArr.count > 0) {
            self.listViewModel.listConfig.cellForRow(cell, indexPath);
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArr.count > 0) {
        id model = self.dataArr[indexPath.row];
        [self.listViewModel.listConfig.clickItemCommand execute:model];
    }
}



- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.listViewModel.emptyImg;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
    return self.listViewModel.emptyTitle;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self getData];
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

- (void)setListDataType:(ListDataType)listDataType{
    _listDataType = listDataType;
    
    if (!self.isRefresh) {
        return;
    }
    
    switch (listDataType) {
        case ListDataTypeOfNoData:
        {
            [self.tableView.mj_header endRefreshing];
            self.tableView.mj_footer = nil;
            
        }
            break;
        case ListDataTypeOfNorme:
        {
            [self.tableView.mj_header endRefreshing];
            if (self.tableView.mj_footer == nil) {
                self.tableView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterTableView)];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
        }
            break;
        case ListDataTypeOfHaveData:
        {
            [self.tableView.mj_header endRefreshing];
            if (self.tableView.mj_footer == nil) {
                self.tableView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterTableView)];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
        }
            break;
        case ListDataTypeOfEndRefresh:
        {
            if (self.tableView.mj_footer == nil) {
                self.tableView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterTableView)];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
            [self.tableView.mj_header endRefreshing];
        }
            break;
        case ListDataTypeOfEndUpdate:
        {
            if (self.tableView.mj_footer == nil) {
                self.tableView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterTableView)];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
            [self.tableView.mj_footer endRefreshing];
            [self.tableView.mj_header endRefreshing];
        }
            break;
        case ListDataTypeOfEndUpdateNoMoreData:
        {
            if (self.tableView.mj_footer == nil) {
                self.tableView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterTableView)];
            }
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            [self.tableView.mj_header endRefreshing];
        }
            break;
            
        default:
            break;
    }
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

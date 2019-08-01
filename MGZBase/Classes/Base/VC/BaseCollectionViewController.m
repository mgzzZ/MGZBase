//
//  BaseCollectionViewController.m
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "BaseCollectionViewController.h"

@interface BaseCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation BaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RAC(self,dataArr) = RACObserve(self.listViewModel, dataArr);
    
    [RACObserve(self.listViewModel, listDataType) subscribeNext:^(id _Nullable viewModel) {
        switch ([viewModel integerValue]) {
                
            case ListDataTypeOfNoData:
            {
                self.collectionView.mj_footer = nil;
            }
                break;
            case ListDataTypeOfHaveData:
            {
                if (self.isRefresh) {
                    self.collectionView.mj_header = [[self refreshClass] headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeaderCollectView)];
                    
                    if (self.collectionView.mj_footer == nil) {
                        self.collectionView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterCollectView)];
                    }
                }
                
            }
                break;
            case ListDataTypeOfEndRefresh:
            {
                [self.collectionView.mj_header endRefreshing];
                if (self.collectionView.mj_footer == nil) {
                    self.collectionView.mj_footer = [[self updateClass] footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterCollectView)];
                }
            }
                break;
                
            case ListDataTypeOfEndUpdate:
            {
                [self.collectionView.mj_footer endRefreshing];
            }
                break;
                
            case ListDataTypeOfEndUpdateNoMoreData:
            {
                [self.collectionView.mj_footer endRefreshingWithNoMoreData];
            }
                break;
                
            default:
                break;
        }
    }];
}

- (instancetype)initWithViewModel:(BaseListViewModel *)viewModel{
    if (self = [super initWithViewModel:viewModel]) {
        self.listViewModel = viewModel;
    }
    return self;
}

- (void)refreshFooterCollectView{
}

- (void)refreshHeaderCollectView{
}


- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
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

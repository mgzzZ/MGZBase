//
//  BaseCollectionViewController.h
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseListViewModel.h"
#import <MJRefresh/MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewController : BaseViewController
@property (nonatomic,strong)BaseListViewModel *listViewModel;

- (instancetype)initWithViewModel:(BaseListViewModel *)viewModel;

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)NSMutableArray *dataArr;

/**
 是否有刷新/加载  默认为NO
 */
@property (nonatomic,assign)BOOL isRefresh;

- (void)refreshHeaderCollectView;

- (void)refreshFooterCollectView;

- (Class )refreshClass;

- (Class )updateClass;
@end

NS_ASSUME_NONNULL_END

//
//  BaseListViewController.h
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "MGZBaseViewController.h"
#import "MGZBaseListViewModel.h"
NS_ASSUME_NONNULL_BEGIN


@interface MGZBaseListViewController : MGZBaseViewController


/// 初始化方法
/// @param viewModel 数据源
- (instancetype)initWithViewModel:(MGZBaseListViewModel *)viewModel;



/// 数据源
@property (nonatomic,strong)NSArray *dataArr;


/// 是否刷新
@property (nonatomic,assign)BOOL isRefresh;


/// 列表
@property (nonatomic,strong)UITableView *tableView;


/// 自定义刷新头部
@property (nonatomic,assign)Class refreshClass;


/// 自定义刷新尾部
@property (nonatomic,assign)Class updateClass;


/// 刷新状态
@property (nonatomic,assign)ListDataType listDataType;
@end

NS_ASSUME_NONNULL_END

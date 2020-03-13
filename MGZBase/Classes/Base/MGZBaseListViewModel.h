//
//  BaseListViewModel.h
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "MGZBaseViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "MGZListConfig.h"
typedef enum : NSUInteger {
    ListDataTypeOfNorme = 0,
    ListDataTypeOfNoData = 1,
    ListDataTypeOfHaveData = 2,
    ListDataTypeOfEndRefresh = 3,
    ListDataTypeOfEndUpdate = 4,
    ListDataTypeOfEndUpdateNoMoreData = 5,
    
} ListDataType;
NS_ASSUME_NONNULL_BEGIN

@interface MGZBaseListViewModel : MGZBaseViewModel


/// 配置列表信息
@property (nonatomic,strong)MGZListConfig *listConfig;


/// 加载页数
@property (nonatomic,assign)NSInteger page;


/// 每页加载数量
@property (nonatomic,assign)NSInteger pageSize;


/// 空白页面图片
@property (nonatomic,strong)UIImage *emptyImg;


/// 空白页面文字
@property (nonatomic,strong)NSAttributedString *emptyTitle;


/// 列表数据
@property (nonatomic,strong)NSArray *dataArr;



/// 刷新数据方法
- (void)refreshData;


/// 加载更多数据方法
- (void)updateData;
@end

NS_ASSUME_NONNULL_END

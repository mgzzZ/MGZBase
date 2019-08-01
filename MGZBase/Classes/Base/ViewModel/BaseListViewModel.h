//
//  BaseListViewModel.h
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "BaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ListDataTypeOfNoData = 0,
    ListDataTypeOfHaveData = 1,
    ListDataTypeOfEndRefresh = 2,
    ListDataTypeOfEndUpdate = 3,
    ListDataTypeOfEndUpdateNoMoreData = 4,
    
} ListDataType;

@interface BaseListViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger page;

@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,assign)ListDataType listDataType;

@property (nonatomic,strong)RACSignal *updateSignal;

@property (nonatomic,strong)RACSignal *refereSignal;

@end

NS_ASSUME_NONNULL_END

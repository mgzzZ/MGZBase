//
//  MGZListConfig.h
//  DemoBase
//
//  Created by mac on 2020/3/13.
//  Copyright © 2020 mgzzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^cellForRowBlcck)(id cell,NSIndexPath *indexPath);

typedef UITableViewCell *_Nullable(^cellForRowMoreTypeBlock)(UITableView *tableView,NSIndexPath *indexPath);
@interface MGZListConfig : NSObject
/// 单一cell 用此方法
@property (nonatomic,strong)NSString *cellClassName;


/// 多种cell 用此方法
@property (nonatomic,strong)NSArray *cellClassNameArr;


/// 固定高度
@property (nonatomic,assign)CGFloat cellHeight;



/// 预估行高
@property (nonatomic,assign)CGFloat estimatedRowHeight;


/// 单一cell 方法
@property (nonatomic,copy)cellForRowBlcck cellForRow;


/// 多种cell 方法
@property (nonatomic,copy)cellForRowMoreTypeBlock cellForRowMoreType;



/// 点击方法
@property (nonatomic,strong)RACCommand *clickItemCommand;
@end

NS_ASSUME_NONNULL_END

//
//  MGZBaseViewModel.h
//  DemoBase
//
//  Created by mac on 2020/3/13.
//  Copyright © 2020 mgzzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGZBaseViewModel : NSObject

/// 控制器类名  默认为MGZBaseViewController
@property (nonatomic,strong)NSString *viewControllerName;


/// 获取数据方法
- (void)getData;
@end

NS_ASSUME_NONNULL_END

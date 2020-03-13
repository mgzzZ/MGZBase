//
//  BaseNavgationController.h
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGZBaseViewController.h"
#import "MGZBaseViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MGZBaseNavgationController : UINavigationController



/// 通过数据源进行跳转
/// @param viewModel 数据源
/// @param animated 是否需要动画
- (void)pushVCOfViewModel:(MGZBaseViewModel *)viewModel animated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END

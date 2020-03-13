//
//  BaseViewController.h
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGZBaseViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
NS_ASSUME_NONNULL_BEGIN

@interface MGZBaseViewController : UIViewController


/// 初始化方法
/// @param viewModel 数据源
- (instancetype)initWithViewModel:(MGZBaseViewModel *)viewModel;


- (void)layoutSubViews;


/// 绑定数据源
/// @param viewModel viewModel
- (void)bindViewModel:(MGZBaseViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END

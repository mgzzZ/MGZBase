//
//  BaseViewController.h
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/**
 点击屏幕缩回键盘 默认NO
 */
@property (nonatomic,assign)BOOL isAction;

@property (nonatomic,strong)BaseViewModel *viewModel;

- (instancetype)initWithViewModel:(BaseViewModel *)ViewModel;

- (void)_initView;

- (void)getData;

@end

NS_ASSUME_NONNULL_END

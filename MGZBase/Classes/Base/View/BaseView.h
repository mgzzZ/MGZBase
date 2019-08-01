//
//  BaseView.h
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView

@property (nonatomic,strong)BaseViewModel *viewModel;

- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;

- (void)_initView;

@end

NS_ASSUME_NONNULL_END

//
//  BaseView.m
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    if (self = [super init]) {
        self.viewModel = viewModel;
        [self _initView];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        [self _initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self _initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self _initView];
    }
    return self;
}


- (void)_initView{
    
}


@end

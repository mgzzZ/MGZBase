//
//  BaseViewController.m
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()



@end

@implementation BaseViewController

- (instancetype)initWithViewModel:(BaseViewModel *)ViewModel{
    if (self = [super init]) {
        self.viewModel = ViewModel;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self _initView];
    [self getData];
    
    if (self.isAction) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
        [tap.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
            [self.view endEditing:YES];
        }];
        [self.view addGestureRecognizer:tap];
    }
    
}

- (void)_initView{
    
}

- (void)getData{
    
}


- (void)setIsAction:(BOOL)isAction{
    _isAction = isAction;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

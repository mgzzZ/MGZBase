//
//  BaseViewController.m
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "MGZBaseViewController.h"

@interface MGZBaseViewController ()
@property (nonatomic,strong)MGZBaseViewModel *viewModel;
@end

@implementation MGZBaseViewController

- (instancetype)initWithViewModel:(MGZBaseViewModel *)viewModel{
    if (self = [super init]) {
        _viewModel = viewModel;
        [self bindViewModel:viewModel];
    }
    return self;
}

- (void)dealloc{
    NSLog(@"%@ dealloc",[self class]);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self layoutSubViews];
}

- (void)layoutSubViews{
    
}

- (void)bindViewModel:(MGZBaseViewModel *)viewModel{
    
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

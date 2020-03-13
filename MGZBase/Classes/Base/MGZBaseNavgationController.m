//
//  BaseNavgationController.m
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "MGZBaseNavgationController.h"

@interface MGZBaseNavgationController ()

@end

@implementation MGZBaseNavgationController
- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}


- (void)popBack {
    [self popViewControllerAnimated:YES];
}



- (void)pushVCOfViewModel:(MGZBaseViewModel *)viewModel animated:(BOOL)animated{
    [self pushViewController:[self viewControllerForViewModel:viewModel] animated:YES];
}



- (MGZBaseViewController *)viewControllerForViewModel:(MGZBaseViewModel *)viewModel {
    NSString *viewController = viewModel.viewControllerName;
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[MGZBaseViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
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

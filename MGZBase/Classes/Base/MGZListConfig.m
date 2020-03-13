//
//  MGZListConfig.m
//  DemoBase
//
//  Created by mac on 2020/3/13.
//  Copyright © 2020 mgzzz. All rights reserved.
//

#import "MGZListConfig.h"

@implementation MGZListConfig

- (RACCommand *)clickItemCommand{
    if (_clickItemCommand == nil) {
        _clickItemCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal return:input];
        }];
    }
    return _clickItemCommand;
}
@end

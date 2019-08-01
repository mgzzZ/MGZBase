//
//  BaseModel.m
//  Base
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.type.code isEqualToString:@"NSString"]) {
        if ([self isEmptyNull:oldValue]) {// 以字符串类型为例
            return  @"";
        }
    }else if ([property.type.code isEqualToString:@"NSMutableArray"]){
        if ([self isEmptyNull:oldValue]) {// 以字符串类型为例
            return  @[];
        }
    }
    return oldValue;
}


- (BOOL)isEmptyNull:(id)text{
    if ([text isEqual:[NSNull null]]) {
        return YES;
    }
    else if ([text isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if (text == nil){
        return YES;
    }
    return NO;
}
@end

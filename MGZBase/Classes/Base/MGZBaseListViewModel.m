//
//  BaseListViewModel.m
//  DemoBase
//
//  Created by mac on 2019/12/19.
//  Copyright © 2019 mgzzz. All rights reserved.
//

#import "MGZBaseListViewModel.h"

@implementation MGZBaseListViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.listConfig = [[MGZListConfig alloc]init];
    }
    return self;
}

- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = @[];
    }
    return _dataArr;
}

- (void)refreshData{
    
}

- (void)updateData{
    
}

- (void)getData{
    
}

- (NSInteger)page{
    return 1;
}

- (NSInteger)pageSize{
    return 10;
}

- (UIImage *)emptyImg{
    return [UIImage imageNamed:@"暂无内容"];
}



- (NSAttributedString *)emptyTitle{
    NSString *text = @"暂无内容";
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
                                 
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
@end

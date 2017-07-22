//
//  XQCoverView.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/15.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQCoverView.h"

@implementation XQCoverView

+ (instancetype)show {
    
    XQCoverView *cover = [[self alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.3;
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    return cover;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.clickTask) {
        self.clickTask();
    }
}

@end

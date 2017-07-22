//
//  XQShareView.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/15.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQShareView.h"

@implementation XQShareView

+ (instancetype)shareView {
    XQShareView *shareV = [[NSBundle mainBundle] loadNibNamed:@"XQShareView" owner:nil options:nil][0];
    shareV.y = screenH ;
    [[UIApplication sharedApplication].keyWindow addSubview:shareV];
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        shareV.y = screenH -  shareV.height;
    } completion:nil];
    return shareV;
}

@end

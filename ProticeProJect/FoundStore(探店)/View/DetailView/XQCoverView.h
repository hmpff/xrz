//
//  XQCoverView.h
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/15.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XQCoverView : UIView

+ (instancetype)show;

//点击时做的事
@property (nonatomic,copy) void(^clickTask)();

@end

//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface XQCenterTitleBtn : UIButton
//图片名称
@property (nonatomic, copy) NSString *imageName;
//标题
@property (nonatomic, copy) NSString *title;

+ (instancetype)centerTitleBtnWithImageName:(NSString *)imageN titleName:(NSString *)title;

@end

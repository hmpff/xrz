//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQTableViewHeader : UIView

//传入模型数组
@property (nonatomic, strong) NSArray *headerItemModelsArray;
//点击按钮是调用,index为当前点击的按钮角标
@property (nonatomic, copy) void (^buttonClickedOperationBlock)(NSInteger index);

@end


// --------------------------SDDiscoverTableViewHeaderItemModel-----------

@interface XQTableViewHeaderItemModel : NSObject
//图片名称
@property (nonatomic, copy) NSString *imageName;
//标题
@property (nonatomic, copy) NSString *title;
//点击要跳转的控制器
@property (nonatomic, copy) Class destinationControllerClass;

//快速创建模型
+ (instancetype)modelWithTitle:(NSString *)title imageName:(NSString *)imageName destinationControllerClass:(Class)destinationControllerClass;

@end
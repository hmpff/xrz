//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface HMPSettingRowItem : NSObject


//typedef enum: NSInteger{
//
//    HMPSettingRowTypeArrow,
//    HMPSettingRowTypeSwitch
//
//}HMPSettingRowType;
//每一组右侧是什么类型的视图
//@property (nonatomic ,assign) HMPSettingRowType rowType;

//图标
@property (nonatomic , strong) UIImage *image;
//标题
@property (nonatomic, strong) NSString *name;
//子标题
@property (nonatomic , strong) NSString *detailTitle;

//根据图片和名称快速创建一个行模型
+ (instancetype)settingRowItemWithImage:(UIImage *)image name:(NSString *)name;

@property (nonatomic ,copy) void(^myTask)(NSIndexPath *indexPath);

@end






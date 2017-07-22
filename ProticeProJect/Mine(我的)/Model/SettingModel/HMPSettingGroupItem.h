//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface HMPSettingGroupItem : NSObject

//一组里面有多少行
@property (nonatomic ,strong) NSArray *rowArray;

//头标题
@property (nonatomic ,strong)NSString *headerTitle;
//行标题
@property (nonatomic, strong) NSString *footerTitle;

//快速创建一个组模型
+ (instancetype)settingGroupItemWithRowArray:(NSArray *)rowArray headerT:(NSString *)headerTitle footerT:(NSString *)footerTitle;


@end

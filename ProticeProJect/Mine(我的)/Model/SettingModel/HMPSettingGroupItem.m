//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "HMPSettingGroupItem.h"

@implementation HMPSettingGroupItem


+ (instancetype)settingGroupItemWithRowArray:(NSArray *)rowArray headerT:(NSString *)headerTitle footerT:(NSString *)footerTitle {

   HMPSettingGroupItem *groupItem =  [[self alloc] init];
    groupItem.rowArray = rowArray;
    groupItem.footerTitle = footerTitle;
    groupItem.headerTitle = headerTitle;
    return groupItem;
}

@end

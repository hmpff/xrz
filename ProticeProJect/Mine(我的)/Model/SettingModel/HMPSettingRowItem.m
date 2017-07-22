//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "HMPSettingRowItem.h"

@implementation HMPSettingRowItem

+ (instancetype)settingRowItemWithImage:(UIImage *)image name:(NSString *)name {
    
    HMPSettingRowItem *rowItem =  [[self alloc] init];
    rowItem.image = image;
    rowItem.name = name;
    return rowItem;
}



@end

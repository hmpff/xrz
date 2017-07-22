//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import <UIKit/UIKit.h>

@class HMPSettingRowItem;
@interface HMPSettingCell : UITableViewCell

//传一个TableView,和指定类型创建一个HMPSettingCell
+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style;

//根据传入的模型决定Cell显示什么样的内容
@property (nonatomic, strong) HMPSettingRowItem *rowItem;

@end

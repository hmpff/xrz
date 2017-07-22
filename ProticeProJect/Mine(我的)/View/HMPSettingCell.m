//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import "HMPSettingCell.h"
#import "HMPSettingRowItem.h"
#import "HMPArrowRowItem.h"
#import "HMPSwitchItem.h"
@implementation HMPSettingCell

+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style{
    static NSString *ID = @"settingCell";
    HMPSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if ( cell == nil) {
        cell = [[HMPSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
    
}

//根据传入的模型决定Cell显示什么样的内容
- (void)setRowItem:(HMPSettingRowItem *)rowItem {

    _rowItem = rowItem;
    //设置数据
    [self setData:rowItem];
    //设置辅助视图
    [self setAssoryView:rowItem];
  
}
//设置数据
- (void)setData:(HMPSettingRowItem *)rowItem {
    
    self.imageView.image = rowItem.image;
    self.textLabel.text = rowItem.name ;
    self.detailTextLabel.text = rowItem.detailTitle;
    
}
//设置辅助视图
- (void)setAssoryView:(HMPSettingRowItem *)rowItem {
    //判断模型的类型
    if ([rowItem isKindOfClass:[HMPArrowRowItem class]]) {
        //设置为剪头
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }else if ([rowItem isKindOfClass:[HMPSwitchItem class]]) {
        //设置为开关
        self.accessoryView = [[UISwitch alloc] init];
    }else {
        //如果都不是, 那么不设置
        self.accessoryView = nil;
    }
}

@end

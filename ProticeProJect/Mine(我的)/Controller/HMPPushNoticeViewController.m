//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "HMPPushNoticeViewController.h"

#import "HMPSettingRowItem.h"
#import "HMPSettingGroupItem.h"
#import "HMPQcodeViewController.h"

#import "HMPArrowRowItem.h"
#import "HMPSwitchItem.h"

#import "HMPAttentionViewController.h"

@interface HMPPushNoticeViewController ()

@end

@implementation HMPPushNoticeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGroup1];
}

- (void)setGroup1{
    
    //创建行.
    HMPArrowRowItem *rowItem = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"RedeemCode"] name:@"关注比赛"];
//    rowItem.rowType = HMPSettingRowTypeArrow;
    rowItem.desClass = [HMPAttentionViewController class];
    
    HMPArrowRowItem *rowItem1 = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"RedeemCode"] name:@"比分直播"];
//    rowItem1.rowType = HMPSettingRowTypeSwitch;
    
    HMPArrowRowItem *rowItem2 = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"RedeemCode"] name:@"摇一摇"];
    rowItem2.myTask = ^(NSIndexPath *indexPath){
        NSLog(@"摇一摇");
    };
    
    
    NSArray *rowArray1 = @[rowItem,rowItem1,rowItem2];
    HMPSettingGroupItem *groupItem = [HMPSettingGroupItem settingGroupItemWithRowArray:rowArray1 headerT:@"组1头部" footerT:@"组1尾部"];
    
    [self.groupArray addObject:groupItem];
}


@end

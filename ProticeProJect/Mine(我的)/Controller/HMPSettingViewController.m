//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "HMPSettingViewController.h"
#import "HMPQcodeViewController.h"
#import "HMPPushNoticeViewController.h"

#import "XQTableViewHeader.h"
#import "XQMineHeadView.h"
#import "HMPSwitchItem.h"


@interface HMPSettingViewController ()


@end

@implementation HMPSettingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    //设置头部
    [self setupHeader];
    //添加一组
    [self setGroup1];
    [self setGroup2];
}



- (void)setupHeader
{
    
    self.tableView.tableHeaderView = [XQMineHeadView mineHeaderView];
}



- (void)setGroup1{
    
    //创建行.
    HMPArrowRowItem *rowItem = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"usercenter"] name:@"个人中心"];
    rowItem.desClass = [HMPQcodeViewController class];
    
    HMPArrowRowItem *rowItem1 = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"orders"] name:@"我的订单"];
    HMPArrowRowItem *rowItem2 = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"setting_like"] name:@"我的收藏"];
     HMPSwitchItem *rowItem3 = [HMPSwitchItem settingRowItemWithImage:[UIImage imageNamed:@"feedback"] name:@"留言反馈"];
    HMPArrowRowItem *rowItem4 = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"recomment"] name:@"应用推荐"];
    
    
    //__weak HMPSettingViewController *weakSelf  = self;
    __weak typeof(HMPSettingViewController) *weakSelf = self;
    rowItem2.myTask = ^(NSIndexPath *indexPath){
        
        HMPQcodeViewController *qcode = [[HMPQcodeViewController alloc] init];
        
        [weakSelf.navigationController pushViewController:qcode animated:YES];
        
    };
    
    
    NSArray *rowArray1 = @[rowItem,rowItem1,rowItem2,rowItem3,rowItem4];
    HMPSettingGroupItem *groupItem = [HMPSettingGroupItem settingGroupItemWithRowArray:rowArray1 headerT:nil footerT:nil];
    
    [self.groupArray addObject:groupItem];

}

- (void)setGroup2{
    
    //创建行.
    HMPArrowRowItem *rowItem = [HMPArrowRowItem settingRowItemWithImage:[UIImage imageNamed:@"orders"] name:@"提醒推送"];
    rowItem.desClass = [HMPPushNoticeViewController class];
    HMPSettingRowItem *rowItem1 = [HMPSettingRowItem settingRowItemWithImage:[UIImage imageNamed:@"usercenter"] name:@"推送"];
    HMPSettingRowItem *rowItem2 = [HMPSettingRowItem settingRowItemWithImage:[UIImage imageNamed:@"setting_like"] name:@"优惠券"];
    HMPSettingRowItem *rowItem3 = [HMPSettingRowItem settingRowItemWithImage:[UIImage imageNamed:@"feedback"] name:@"优惠券"];
    
    NSArray *rowArray1 = @[rowItem,rowItem1,rowItem2,rowItem3];
    
      HMPSettingGroupItem *groupItem = [HMPSettingGroupItem settingGroupItemWithRowArray:rowArray1 headerT:@"组1头部" footerT:@"组1尾部"];
    [self.groupArray addObject:groupItem];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 0;
    }else {
        return 100;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        XQTableViewHeaderItemModel *model0 = [XQTableViewHeaderItemModel modelWithTitle:@"红包" imageName:@"adw_icon_apcoupon_normal" destinationControllerClass:nil];
        
        XQTableViewHeaderItemModel *model1 = [XQTableViewHeaderItemModel modelWithTitle:@"电子券" imageName:@"adw_icon_coupon_normal" destinationControllerClass:nil];
        
        XQTableViewHeaderItemModel *model2 = [XQTableViewHeaderItemModel modelWithTitle:@"行程单" imageName:@"adw_icon_travel_normal" destinationControllerClass:nil];
        
        XQTableViewHeaderItemModel *model3 = [XQTableViewHeaderItemModel modelWithTitle:@"会员卡" imageName:@"adw_icon_membercard_normal" destinationControllerClass:nil];
        
        XQTableViewHeader *header = [[XQTableViewHeader alloc] init];
        header.height = 100;
        
        
        header.headerItemModelsArray = @[model0, model1, model2, model3];
//        __weak HMPTableViewHeader *weakHeader = header;
//        __weak typeof(self) weakSelf = self;
        header.buttonClickedOperationBlock = ^(NSInteger index){
            
//            HMPTableViewHeaderItemModel *model = weakHeader.headerItemModelsArray[index];
//            UIViewController *vc = [[model.destinationControllerClass alloc] init];
//            vc.title = model.title;
//            [weakSelf.navigationController pushViewController:vc animated:YES];
            
            NSLog(@"%ld",index);
            
        };
        return header;
    }else {
        return nil;
    }
}





@end

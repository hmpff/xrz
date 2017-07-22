//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import "HMPAttentionViewController.h"
#import "HMPSwitchItem.h"

@interface HMPAttentionViewController ()

@end

@implementation HMPAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGroup1];
    [self setGroup2];
    [self setGroup2];
    [self setGroup2];
    [self setGroup2];
    [self setGroup2];
    [self setGroup2];
    
    
}


- (void)setGroup1{
    
    //创建行.
    HMPSwitchItem *rowItem = [HMPSwitchItem settingRowItemWithImage:[UIImage imageNamed:@"RedeemCode"] name:@"关注比赛"];
    
    NSArray *rowArray1 = @[rowItem];
    HMPSettingGroupItem *groupItem = [HMPSettingGroupItem settingGroupItemWithRowArray:rowArray1 headerT:nil footerT:nil];
    [self.groupArray addObject:groupItem];
    
    

}

- (void)setGroup2{
    
    //创建行.
    HMPSettingRowItem *rowItem = [HMPSettingRowItem settingRowItemWithImage:[UIImage imageNamed:@"RedeemCode"] name:@"关注比赛"];
    rowItem.detailTitle = @"00:00";
    
    rowItem.myTask = ^(NSIndexPath *indexPath){
    
        NSLog(@"asdfa");
        
        //根据indexPath取出当前的Cell
        UITableViewCell *cell =  [self.tableView cellForRowAtIndexPath:indexPath];
        UITextField *textF = [[UITextField alloc] init];
        [cell addSubview:textF];
        [textF becomeFirstResponder];
        
        
    };
    
    NSArray *rowArray1 = @[rowItem];
    HMPSettingGroupItem *groupItem = [HMPSettingGroupItem settingGroupItemWithRowArray:rowArray1 headerT:nil footerT:nil];
    [self.groupArray addObject:groupItem];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    HMPSettingCell *cell = [HMPSettingCell cellWithTableView:tableView cellStyle:UITableViewCellStyleValue1];
    
    HMPSettingGroupItem *groupItem =  self.groupArray[indexPath.section];
    HMPSettingRowItem *item = groupItem.rowArray[indexPath.row];
    cell.rowItem = item;
    
    return cell;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //隐藏键盘
    [self.view endEditing:YES];
}







@end

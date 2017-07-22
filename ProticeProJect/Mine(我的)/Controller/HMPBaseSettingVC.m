//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "HMPBaseSettingVC.h"

@interface HMPBaseSettingVC ()

@end

@implementation HMPBaseSettingVC

//初始化为一个组样式
-(instancetype)init {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}
//创建存放组模型的数组
- (NSMutableArray *)groupArray {
    
    if (_groupArray == nil) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}
//共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupArray.count;
}
//每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //取出当前的组模型
    HMPSettingGroupItem *groupItem =  self.groupArray[section];
    //返加第一组里面行的个数
    return groupItem.rowArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取当前的Cell
    HMPSettingCell *cell = [HMPSettingCell cellWithTableView:tableView cellStyle:UITableViewCellStyleDefault];
    
    //取出当前的组模型
    HMPSettingGroupItem *groupItem =  self.groupArray[indexPath.section];
    //取出组模型当中的每一行.
    HMPSettingRowItem *item = groupItem.rowArray[indexPath.row];
    //把行模型传递给Cell
    cell.rowItem = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取出当前的组模型
    HMPSettingGroupItem *groupItem =  self.groupArray[indexPath.section];
    //取出组模型当中的每一行.
    HMPSettingRowItem *item = groupItem.rowArray[indexPath.row];
    //如果有要执行的Block
    if (item.myTask) {
        //直接执行Block
        item.myTask(indexPath);
        //执行完后,直接返回
        return;
    }
    
    //判断行模型的类型.
    if ([item isKindOfClass:[HMPArrowRowItem class]]) {
        //如果是箭头模型,
        HMPArrowRowItem *arrowItem = (HMPArrowRowItem *)item;
        if (arrowItem.desClass) {
            //创建控制器.跳转到目标控制器
            UIViewController *vc = [[arrowItem.desClass alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

//返回当前组的尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    HMPSettingGroupItem *item = self.groupArray[section];
    return item.footerTitle;
}
//返回当前组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    HMPSettingGroupItem *item = self.groupArray[section];
    return item.headerTitle;
}



@end

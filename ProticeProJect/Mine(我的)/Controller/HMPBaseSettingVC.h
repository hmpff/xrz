//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HMPArrowRowItem.h"

#import "HMPSettingGroupItem.h"
#import "HMPSettingRowItem.h"
#import "HMPSettingCell.h"

@interface HMPBaseSettingVC : UITableViewController

//存放组模型的数组
@property (nonatomic , strong) NSMutableArray *groupArray;


@end

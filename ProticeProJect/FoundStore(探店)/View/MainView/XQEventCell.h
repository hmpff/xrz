//
//  XQEventCell.h
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>


@class XQBeautifulDayItem;
@interface XQEventCell : UITableViewCell

+ (XQEventCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) XQBeautifulDayItem *beautifulDayItem;

@end

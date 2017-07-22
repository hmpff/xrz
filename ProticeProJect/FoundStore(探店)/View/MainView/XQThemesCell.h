//
//  XQThemesCell.h
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XQThemesItem;
@interface XQThemesCell : UITableViewCell

+ (XQThemesCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) XQThemesItem *themeItem;

@end

//
//  XQEventCell.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQEventCell.h"
#import "XQBeautifulDayItem.h"

#import "UIImageView+WebCache.h"
#import "XQEventsItem.h"

@interface XQEventCell()

@property (weak, nonatomic) IBOutlet UILabel *month;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *MainTitle;

@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UIImageView *backImageV;

@end

@implementation XQEventCell

+ (XQEventCell *)cellWithTableView:(UITableView *)tableView {
    
    
    static NSString *ID = @"EventCell";
    XQEventCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"XQEventCell" owner:nil options:nil][0];
    }
    
    return cell;
}

//赋值数据
- (void)setBeautifulDayItem:(XQBeautifulDayItem *)beautifulDayItem {
    _beautifulDayItem = beautifulDayItem;
    
    self.dayLabel.text = beautifulDayItem.day;
    self.month.text = beautifulDayItem.month;
    XQEventsItem *events = beautifulDayItem.events.lastObject;
    
    self.titleLabel.text = events.feeltitle;
    self.MainTitle.text = events.title;
    self.subTitle.text = events.address;
    
    NSURL *url = [NSURL URLWithString:events.imgs.lastObject];
    [self.backImageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    
    
}

@end

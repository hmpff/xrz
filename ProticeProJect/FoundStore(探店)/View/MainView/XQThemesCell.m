//
//  XQThemesCell.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQThemesCell.h"
#import "XQThemesItem.h"
#import "UIImageView+WebCache.h"

@interface XQThemesCell()

@property (weak, nonatomic) IBOutlet UIImageView *backImageV;
//做毛玻璃,还没有实现
@property (weak, nonatomic) IBOutlet UIImageView *moreshadows;
//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//子标题
@property (weak, nonatomic) IBOutlet UILabel *subLabel;


@end

@implementation XQThemesCell

+ (XQThemesCell *)cellWithTableView:(UITableView *)tableView {
    
    
    static NSString *ID = @"ThemesCell";
    XQThemesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"XQThemesCell" owner:nil options:nil][0];
    }
    
    return cell;
}

- (void)setThemeItem:(XQThemesItem *)themeItem {
    _themeItem = themeItem;
    
    NSURL *url = [NSURL URLWithString:themeItem.img];
    [self.backImageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    self.titleLabel.text = themeItem.title;
    self.subLabel.text = themeItem.keywords;
}
@end

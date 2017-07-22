//
//  XQExperienceCell.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/19.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQExperienceCell.h"
#import "XQThemesItem.h"
#import "UIImageView+WebCache.h"

@interface XQExperienceCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation XQExperienceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setThemeItem:(XQThemesItem *)themeItem {
    _themeItem = themeItem;
    self.titleLabel.text = themeItem.title;
    self.detailLabel.text = themeItem.keywords;
    
    NSURL *url = [NSURL URLWithString:themeItem.img];
    [self.imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    
    
}

@end

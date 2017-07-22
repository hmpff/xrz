//
//  XQClassifyCell.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/16.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQClassifyCell.h"
#import "XQClassifyDetailItem.h"
#import "UIImageView+WebCache.h"
@interface XQClassifyCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation XQClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.nameLabel.text = @"test";
}

- (void)setDetailItem:(XQClassifyDetailItem *)detailItem {
    _detailItem = detailItem;
    
    self.nameLabel.text = detailItem.name;
    NSURL *url = [NSURL URLWithString:detailItem.img];
    [self.imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    

    
}

@end

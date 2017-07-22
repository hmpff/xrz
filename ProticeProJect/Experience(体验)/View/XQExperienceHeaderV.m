//
//  XQExperienceHeaderV.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/19.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQExperienceHeaderV.h"
#import "UIImageView+WebCache.h"

#import "XQEventsItem.h"
@interface XQExperienceHeaderV()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation XQExperienceHeaderV

- (void)setEventItem:(XQEventsItem *)eventItem {
    _eventItem = eventItem;

    
    self.titleLabel.text = eventItem.feeltitle;
    self.detailLabel.text = eventItem.title;
    
    NSURL *url = [NSURL URLWithString:eventItem.imgs.lastObject];
    [self.imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    
}

@end

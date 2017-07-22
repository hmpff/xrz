//
//  XQCityCell.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/12.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQCityCell.h"

@interface XQCityCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation XQCityCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置UI
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

- (void)setCityName:(NSString *)cityName {
    _cityName = cityName;
    self.titleLabel.text = cityName;
}


@end

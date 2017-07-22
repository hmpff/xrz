//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQIconView.h"

#define border 8
#define lineW 2

@implementation XQIconView

- (void)awakeFromNib {
    //添加头像
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"backImageV"];
    iconView.frame = CGRectMake(border, border, 100 - 2 * border, 100
                                - 2 * border);
    iconView.layer.cornerRadius = iconView.width * 0.5;
    iconView.layer.masksToBounds = YES;
    [self addSubview:iconView];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(lineW, lineW, rect.size.width - lineW * 2, rect.size.height - lineW * 2)];
    [[UIColor whiteColor] set];
    [path setLineWidth:lineW];
    [path stroke];
}


@end

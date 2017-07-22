//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQMineHeadView.h"

@interface XQMineHeadView()
@property (nonatomic, weak)UIVisualEffectView *visualV;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation XQMineHeadView

- (void)awakeFromNib {
    
    //创建需要的毛玻璃特效类型
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    //创建毛玻璃视图
    UIVisualEffectView *visualV = [[UIVisualEffectView alloc] init];
    visualV.frame = self.imageV.bounds;
    self.visualV = visualV;
    //可以通过透明度来达到模糊程序的改变.
    visualV.effect = nil;
    [UIView animateWithDuration:0.01 animations:^{
        visualV.effect = blur;
    }];
    
    //把毛玻璃添加到ImageV上
    [self.imageV addSubview:visualV];

    
}

+ (instancetype)mineHeaderView {
    
    return [[NSBundle mainBundle] loadNibNamed:@"XQMineHeadView" owner:nil options:nil][0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.visualV.frame = self.imageV.bounds;
}




@end

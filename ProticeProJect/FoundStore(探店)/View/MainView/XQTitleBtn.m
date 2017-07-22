//
//  XQTitleBtn.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQTitleBtn.h"

@implementation XQTitleBtn


//取消按钮高亮
- (void)setHighlighted:(BOOL)highlighted {

}

//文字大小自适应
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}

//调整按钮内容文字图片
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width;
    
}




@end

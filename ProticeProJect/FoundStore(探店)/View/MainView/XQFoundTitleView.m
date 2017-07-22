//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//


//自定义的按钮
@interface TitleBtn : UIButton
//中间的线
@property (nonatomic, weak) UIView *middleV;
//是否隐藏线
@property (nonatomic, assign) BOOL isHiddenMiddle;

@end


@implementation TitleBtn

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *middleV = [[UIView alloc] init];
        middleV.backgroundColor = XQColor(50, 50, 50, 0.3);
        [self addSubview:middleV];
        self.middleV = middleV;
    }
    return self;
}
- (void)setIsHiddenMiddle:(BOOL)isHiddenMiddle {
    _isHiddenMiddle = isHiddenMiddle;
    if (isHiddenMiddle) {
        self.middleV.hidden = YES;
    }else {
        self.middleV.hidden = NO;
    }
}

//布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat middleH = self.height * 0.5;
    CGFloat y = (self.height - middleH) * 0.5;
    self.middleV.frame = CGRectMake(self.width, y, 1, middleH);
}


@end






#import "XQFoundTitleView.h"

@interface XQFoundTitleView()

//底层线
@property (nonatomic, weak) UIView *bottomLine;

//中间线
@property (nonatomic, weak) UIView *middleV;

//当前选中的按钮
@property (nonatomic, weak) UIButton *selectBtn;

//按钮的宽度
@property (nonatomic, assign)CGFloat btnW;

@end

@implementation XQFoundTitleView


- (instancetype)initWithTitleArray:(NSArray *)array {
    if (self = [super init]) {
        self.titleArray = array;
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    
    for (NSString *title in titleArray) {
        
        TitleBtn *rightbtn = [TitleBtn buttonWithType:UIButtonTypeCustom];
        [rightbtn setTitle:title forState:UIControlStateNormal];
        //设置选中时的颜色
        [rightbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [rightbtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [self addSubview:rightbtn];
        [rightbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (self.subviews.count == titleArray.count) {
            rightbtn.isHiddenMiddle = YES;
        }
        
    }
    [self setBottomLine];
}



//添加底部的线
- (void)setBottomLine {
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = XQColor(60, 60, 60, 1);
    [self addSubview:bottomLine];
    self.bottomLine = bottomLine;
}

//按钮点击
- (void)btnClick:(UIButton *)btn {
    
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomLine.x = btn.x;
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            self.bottomLine.x = btn.x;
            
        } completion:nil];
    }];
    //调用代理
    if ([self.delegate respondsToSelector:@selector(foundTitleView:didClickBtnIndex:)]) {
        [self.delegate foundTitleView:self didClickBtnIndex:btn.tag];
    }
}

//底部线滚动到对应的位置
- (void)bottomLineScollIndex:(int)index {
    [UIView animateWithDuration:0.25 animations:^{
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //设置线的位置
            self.bottomLine.x = index * self.btnW;
            UIButton *btn = self.subviews[index];
            //设置按钮选中
            self.selectBtn.selected = NO;
            btn.selected = YES;
            self.selectBtn = btn;
            
        } completion:nil];
    }];
}

//布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
    int count = (int)self.subviews.count - 1;
    self.btnW = self.width /  count;
    CGFloat btnH = self.height;
    for (int i = 0; i < count; i++) {
        //取出子控件
        TitleBtn *btn = self.subviews[i];
        btn.frame = CGRectMake(i * self.btnW, 0, self.btnW, btnH);
        btn.tag = i;
        if (i == 0) {
            [self btnClick:btn];
        }
    }
   self.bottomLine.frame = CGRectMake(0, self.height - 2, self.btnW, 2);
}

@end

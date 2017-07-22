//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import "XQWriteViewController.h"
#import "XQCenterTitleBtn.h"

@interface XQWriteViewController ()

@property (nonatomic, weak)  UIButton *closeBtn;

@end

@implementation XQWriteViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    

    //创建需要的毛玻璃特效类型
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    //创建毛玻璃视图
    UIVisualEffectView *visualV = [[UIVisualEffectView alloc] init];
    visualV.frame = self.view.bounds;
    //可以通过透明度来达到模糊程序的改变.
    visualV.effect = nil;
    [UIView animateWithDuration:0.01 animations:^{
        visualV.effect = blur;
    }];
    //把毛玻璃添加到ImageV上
    [self.view addSubview:visualV];
    
    

    XQCenterTitleBtn *btn1 = [XQCenterTitleBtn centerTitleBtnWithImageName:@"tabbar_compose_camera" titleName: @"相机"];
    XQCenterTitleBtn *btn3 = [XQCenterTitleBtn centerTitleBtnWithImageName:@"tabbar_compose_friend" titleName: @"朋友"];
    XQCenterTitleBtn *btn4 = [XQCenterTitleBtn centerTitleBtnWithImageName:@"tabbar_compose_idea" titleName: @"写主意"];
    XQCenterTitleBtn *btn6 = [XQCenterTitleBtn centerTitleBtnWithImageName:@"tabbar_compose_music" titleName: @"音乐"];
    XQCenterTitleBtn *btn7 = [XQCenterTitleBtn centerTitleBtnWithImageName:@"tabbar_compose_photo" titleName: @"照片"];
    XQCenterTitleBtn *btn9 = [XQCenterTitleBtn centerTitleBtnWithImageName:@"tabbar_compose_more" titleName: @"更多"];
   
    NSArray *btnArray = @[btn1,btn3,btn4,btn6,btn7,btn9];
    int coloumn = 3;
    CGFloat btnWH = 120;
    CGFloat margin = (self.view.width - coloumn * btnWH) / (coloumn + 1);
    CGFloat x = 0;
    CGFloat y = 0;
    int curL = 0;
    int curR = 0;
    CGFloat oriY = 200;
    //遍历指定的数组
    for (int i = 0; i < btnArray.count; i++) {
        UIButton *btn = btnArray[i];
        btn.tag = i;
        curL = i % coloumn;
        curR = i / coloumn;;
        x = margin + (margin + btnWH) * curL;
        y = oriY + (margin + btnWH) * curR;
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
        [self.view addSubview:btn];
        //添加按钮时,把所有的按钮移动底部
        btn.transform = CGAffineTransformMakeTranslation(0, screenH);
        //监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //询问条
    UIView *bottomV = [[UIView alloc] init];
    bottomV.backgroundColor = [UIColor whiteColor];
    CGFloat btnH = 49;
    bottomV.frame = CGRectMake(0, screenH - btnH, screenW, btnH);
    [self.view addSubview:bottomV];
    
    //关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.userInteractionEnabled = NO;
    [closeBtn setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
    CGFloat closeBtnW = 25;
    closeBtn.frame = CGRectMake((bottomV.width - closeBtnW) * 0.5, (bottomV.height - closeBtnW) * 0.5, closeBtnW, closeBtnW);
    [bottomV addSubview:closeBtn];
    self.closeBtn = closeBtn;
    self.closeBtn.transform = CGAffineTransformMakeRotation(-M_PI_4);
    
}

#pragma -mark View即将显示
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //在即将显示的时候,添加按钮动画
    for (int i = 0; i < self.view.subviews.count; i++) {
        
        UIView *view = self.view.subviews[i];
        if ([view isKindOfClass:[XQCenterTitleBtn class]]) {
            //把所有按钮从底部移上来,利用清空形变
            //每一个动画添加一个延时时间.
            [UIView animateWithDuration:0.5 delay: i * 0.05 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                //清空形变.
                view.transform = CGAffineTransformIdentity;
            } completion:nil];
        }
    }

    [UIView animateWithDuration:0.25 animations:^{
       self.closeBtn.transform = CGAffineTransformIdentity;
    }];
}


#pragma -mark 点击按钮
- (void)btnClick:(UIButton *)btn {
    //根据按钮的Tag可以得知当前点击的是第几个按钮
    //按钮动画
    for (int i = 0; i < self.view.subviews.count; i++) {
        UIView *view = self.view.subviews[i];
        if ([view isKindOfClass:[XQCenterTitleBtn class]]) {
            //判断如果是当前点击的按钮, 让按钮这么大
            if (btn == view) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    //放大按钮
                    btn.layer.transform = CATransform3DMakeScale(3.0, 3.0, 1);
                    //让大同时,变为透明
                    btn.alpha = 0;
                }completion:^(BOOL finished) {
                    //关闭
                    [UIView animateWithDuration:0.25 animations:^{
                        self.view.alpha = 0;
                    }completion:^(BOOL finished) {
                        self.closeTask();
                    }];
                }];
            }else {
                //不是当前点击的按钮,让其全部缩小
                [UIView animateWithDuration:0.5 animations:^{
                    view.transform = CGAffineTransformMakeScale(0.001, 0.001);
                    view.alpha = 0;
                }];
            }
        }
    }
    
    
    
    
}


#pragma -mark 点击关闭
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //关闭
    [self colse];
}
//关闭
- (void)colse {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.closeBtn.transform = CGAffineTransformMakeRotation(-M_PI_4);
    }];
    
    NSArray *subView = self.view.subviews;
    //反转数组
    NSArray *array = [[subView reverseObjectEnumerator] allObjects];
    //在即将显示的时候,添加按钮动画
    for (int i = 0; i < array.count; i++) {
        
        UIView *view = array[i];
        if ([view isKindOfClass:[XQCenterTitleBtn class]]) {
            //把所有按钮从底部移上来,利用清空形变
            //每一个动画添加一个延时时间.
            [UIView animateWithDuration:0.5 delay: i * 0.05 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                //把所有的按钮移动底部
                view.transform = CGAffineTransformMakeTranslation(0, screenH);
            } completion:nil];
        }
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 animations:^{
            self.view.alpha = 0;
        }completion:^(BOOL finished) {
            self.closeTask();
        }];
    });
}

//- (void)dealloc {
//    NSLog(@"%s",__func__);
//}


@end

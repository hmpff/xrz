//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQNearViewController.h"

@interface XQNearViewController ()



@end


@implementation XQNearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUp];
}

- (void)setUp {
    
    UIView *animBack = [[UIView alloc] init];
    
    animBack.width = screenW;
    animBack.height = screenW;
    animBack.center = self.view.center;
    [self.view addSubview:animBack];
    
    
    //添加子控件
    CAShapeLayer *shapL = [CAShapeLayer layer];
    shapL.frame = animBack.bounds;
    shapL.fillColor = [UIColor redColor].CGColor;
    shapL.path = [UIBezierPath bezierPathWithOvalInRect:shapL.bounds].CGPath;
    shapL.opacity = 0;
    
    //添加一个复制层
    CAReplicatorLayer *repL = [[CAReplicatorLayer alloc] init];
    repL.frame = animBack.bounds;
    repL.instanceCount = 4;
    repL.instanceDelay = 0.5;
    [animBack.layer addSublayer:repL];
    [repL addSublayer:shapL];
    
    
    
    
    //添加动画
    //添加透明动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @(0.3);
    anim.toValue = @(0);
    
    //添加放大动画
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim2.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 0)];
    anim2.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 0)];
    
    CAAnimationGroup *groupA = [CAAnimationGroup animation];
    groupA.animations = @[anim,anim2];
    groupA.duration = 3.0;
    groupA.repeatCount = HUGE;
    [shapL addAnimation:groupA forKey:nil];
}



@end

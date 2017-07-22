//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQTabBarController.h"

#import "HMPSettingViewController.h"
#import "XQClassifViewController.h"
#import "XQExperienceViewController.h"
#import "XQFoundStoreViewController.h"
#import "XQWriteViewController.h"

#import "XQNavigationController.h"
#import "UIImage+Image.h"



@interface XQTabBarController ()

@property (nonatomic, strong) XQWriteViewController *writeVC;

@end

@implementation XQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bar"];
    self.tabBar.tintColor = [UIColor blackColor];
    //添加所有子控制器
    [self addAllChildVc];
    
    //设置tabBar
    [self setUpTabBar];
 
}


- (void)setUpTabBar {
    //创建背景图片
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"tabbar_bg"];
    [imageV setContentMode:UIViewContentModeCenter];
    imageV.frame = CGRectMake(0, -8, self.tabBar.width, self.tabBar.height);
    //把图片添加到tabBar底部
    [self.tabBar insertSubview:imageV atIndex:0];
    //去掉系统tabBar的线
    [self.tabBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]]];

}


//在View显示完毕时, 添加按钮,覆盖在底部按钮之上.
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //创建添加按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"btn_card"] forState:UIControlStateNormal];
    CGFloat btnWH = 98;
    //按钮剧中显示
    addBtn.frame = CGRectMake((screenW - btnWH) * 0.5,-32, btnWH, btnWH);
    [self.tabBar addSubview:addBtn];
    //监听按钮点击
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

//添加按钮点击
- (void)addBtnClick {
    
    XQWriteViewController *writeVC = [[XQWriteViewController alloc] init];
    self.writeVC = writeVC;
    __weak typeof(self) weakSelf = self;
    writeVC.closeTask = ^{
        weakSelf.writeVC = nil;
    };
    [[UIApplication sharedApplication].keyWindow addSubview:writeVC.view];
    
}


//添加所有子控制器
- (void)addAllChildVc {
    //探店
    XQFoundStoreViewController *foundVC = [[XQFoundStoreViewController alloc] init];
    [self addOneChildVc:foundVC image:[UIImage imageNamed:@"recommendation_1"] selImage:[UIImage imageNamed:@"recommendation_2"] title:@"探店"];
    //体验
    XQExperienceViewController *experVC = [[XQExperienceViewController alloc] init];
    [self addOneChildVc:experVC image:[UIImage imageNamed:@"broadwood_1"] selImage:[UIImage imageNamed:@"broadwood_2"] title:@"体验"];
    
    [self addOneChildVc:[[UIViewController alloc] init] image:nil selImage:nil title:nil];
    
    //分类
    XQClassifViewController *classifyVC = [[XQClassifViewController alloc] init];
    [self addOneChildVc:classifyVC image:[UIImage imageNamed:@"classification_1"] selImage:[UIImage imageNamed:@"classification_2"] title:@"分类"];
    //我的
    HMPSettingViewController *mineVC = [[HMPSettingViewController alloc] init];
    [self addOneChildVc:mineVC image:[UIImage imageNamed:@"my_1"] selImage:[UIImage imageNamed:@"my_2"] title:@"我的"];
}

//添加一个子控制器
- (void)addOneChildVc:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title {
    
    XQNavigationController *nav = [[XQNavigationController alloc] initWithRootViewController:vc];
    //设置TabBar内容
    nav.tabBarItem.title  = title;
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = selImage;
    //添加子控制器
    [self addChildViewController:nav];
}

@end

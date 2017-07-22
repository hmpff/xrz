//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQNavigationController.h"

@interface XQNavigationController ()

@end

@implementation XQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.tintColor = [UIColor blackColor];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count != 0) {
        //在push时隐藏底部tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        [super pushViewController:viewController animated:animated];
    }else {
        [super pushViewController:viewController animated:animated];
    }
}


@end

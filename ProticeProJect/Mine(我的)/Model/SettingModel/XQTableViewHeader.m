//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQTableViewHeader.h"
#import "XQCenterTitleBtn.h"


@implementation XQTableViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置背景
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

//在传入模型数组时创建按钮
- (void)setHeaderItemModelsArray:(NSArray *)headerItemModelsArray
{
    _headerItemModelsArray = headerItemModelsArray;
    //遍历数组当中所有模型
    [headerItemModelsArray enumerateObjectsUsingBlock:^(XQTableViewHeaderItemModel *model, NSUInteger idx, BOOL *stop) {
        //创建按钮
        XQCenterTitleBtn *button = [[XQCenterTitleBtn alloc] init];
        //绑定Tag值
        button.tag = idx;
        //设置标题
        button.title = model.title;
        //设置图片
        button.imageName = model.imageName;
        //监听按钮点击
        [button addTarget:self action:@selector(buttonClickd:) forControlEvents:UIControlEventTouchUpInside];
        //添加按钮
        [self addSubview:button];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //布局子控件
    if (self.subviews.count == 0) return;
    //按钮宽度为平分
    CGFloat w = self.width / self.subviews.count;
    CGFloat h = self.height;
    //遍历所有子控件
    [self.subviews enumerateObjectsUsingBlock:^(UIView *button, NSUInteger idx, BOOL *stop) {
        //设置位置
        button.frame = CGRectMake(idx * w, 0, w, h);
    }];
}

- (void)buttonClickd:(XQCenterTitleBtn *)button
{
    if (self.buttonClickedOperationBlock) {
        self.buttonClickedOperationBlock(button.tag);
    }
}

@end


@implementation XQTableViewHeaderItemModel

+ (instancetype)modelWithTitle:(NSString *)title imageName:(NSString *)imageName destinationControllerClass:(Class)destinationControllerClass
{
    XQTableViewHeaderItemModel *model = [[XQTableViewHeaderItemModel alloc] init];
    model.title = title;
    model.imageName = imageName;
    model.destinationControllerClass = destinationControllerClass;
    return model;
}

@end

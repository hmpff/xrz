//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XQFoundTitleView;
@protocol XQFoundTitleViewDelegate <NSObject>

/**
 * 点击了标题按钮时调用, 传数为传入的角标
 *
 *  @param titleView 当前view
 *  @param btnIndex  当前点击按钮的角标
 */
- (void)foundTitleView:(XQFoundTitleView *)titleView didClickBtnIndex:(NSInteger )btnIndex;

@end

@interface XQFoundTitleView : UIView

//代理属性
@property (nonatomic, weak) id <XQFoundTitleViewDelegate> delegate;


/**
 *  传入的标题
 */
@property (nonatomic, strong) NSArray *titleArray;

/**
 *  初始化时传入标题创建对象
 *
 *  @param array 传入的标题
 *
 *  @return 创建好的View
 */
- (instancetype)initWithTitleArray:(NSArray *)array;

//底部线滚动到对应的位置
- (void)bottomLineScollIndex:(int)index;

@end


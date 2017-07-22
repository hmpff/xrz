//
//  XQShowDetailContentView.h
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/12.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XQEventsItem; 
@interface XQShowDetailContentView : UIView

+ (instancetype)showDetailContentView;

@property (nonatomic, strong) XQEventsItem *events;

@end

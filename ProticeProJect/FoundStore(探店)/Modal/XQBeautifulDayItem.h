//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface XQBeautifulDayItem : NSObject

//组标题
@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) NSArray *events;

@property (nonatomic, strong) NSArray *themes;

@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *day;


+ (NSArray *)getMessage;



@end

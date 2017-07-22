//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface XQThemesItem : NSObject

@property (nonatomic, strong) NSString *begin_time;
@property (nonatomic, assign) NSInteger hasweb;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *themeurl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger ID;

+ (instancetype)themsItemWithDict:(NSDictionary *)dict;

+ (NSArray *)getThemesData;





@end

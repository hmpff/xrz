//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQClassifyItem : NSObject

//ID
@property (nonatomic, assign) int ID;
//所有店
@property (nonatomic, strong) NSMutableArray *tags;
//标题
@property (nonatomic, strong) NSString *title;

+ (instancetype)itemWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)getClassifyData;
@end

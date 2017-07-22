//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQClassifyDetailItem : NSObject

@property (nonatomic, assign) int ev_count;
@property (nonatomic, assign) int ID;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *name;

+ (instancetype)itemWithDict:(NSDictionary *)dict;


@end

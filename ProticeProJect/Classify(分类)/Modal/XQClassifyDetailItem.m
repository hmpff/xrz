//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//
#import "XQClassifyDetailItem.h"

@implementation XQClassifyDetailItem

+ (instancetype)itemWithDict:(NSDictionary *)dict {
    
    XQClassifyDetailItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self.ID = (int)value;
        return;
    }
    [super setValue:value forKey:key];
    
}

@end

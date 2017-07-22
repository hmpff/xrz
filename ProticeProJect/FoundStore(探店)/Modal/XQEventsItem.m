//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQEventsItem.h"

@implementation XQEventsItem

+ (instancetype)eventsItemWithDict:(NSDictionary *)dict {
    
    XQEventsItem *item = [[XQEventsItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

@end

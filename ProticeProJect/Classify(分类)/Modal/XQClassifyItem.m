//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQClassifyItem.h"
#import "XQClassifyDetailItem.h"

@implementation XQClassifyItem



+ (NSMutableArray *)getClassifyData {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Classify.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        XQClassifyItem *item = [[self alloc] init];
        [item setValuesForKeysWithDictionary:dict];
        [tempArray addObject:item];
    }
    return tempArray;
}


+ (instancetype)itemWithDict:(NSDictionary *)dict {
    
    XQClassifyItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    
    
    if ([key isEqualToString:@"tags"]) {
       
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in (NSArray *)value) {
            XQClassifyDetailItem *model = [XQClassifyDetailItem itemWithDict:dict];
            [arrM addObject:model];
        }
        self.tags = arrM;
        return;
    }
    [super setValue:value forKey:key];
}

@end

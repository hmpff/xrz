//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import "XQThemesItem.h"

@implementation XQThemesItem


+ (instancetype)themsItemWithDict:(NSDictionary *)dict {
    
    XQThemesItem *item = [[XQThemesItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    // 拦截body
    if ([key isEqualToString:@"id"]) {
        self.ID = (NSInteger)value;
        return;
    }
    [super setValue:value forKey:key];
}

+ (NSArray *)getThemesData {
    
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"themes" ofType:nil];
//        NSData *data = [NSData dataWithContentsOfFile:filePath];
//        if (data != nil) {
//              NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//              NSArray *array = dict[@"list"];
//            [array writeToFile:@"/Users/gaoxinqiang/Desktop/theme.plist" atomically:YES];
//        }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"theme.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        XQThemesItem *item = [[self alloc] init];
        [item setValuesForKeysWithDictionary:dict];
        [tempArray addObject:item];
    }
    
    return tempArray;
}



@end

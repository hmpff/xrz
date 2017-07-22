//
//  ProticeProJect.pch
//  ProticeProJect
//
//  Created by XQ_明鹏 on 15/8/5.
//  Copyright © 2015年 明鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQEventsItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, assign) NSInteger eid;
@property (nonatomic, assign) NSInteger enddate;
@property (nonatomic, assign) NSInteger eventtype;
@property (nonatomic, strong) NSString *feel;
@property (nonatomic, strong) NSString *feelnum;
@property (nonatomic, strong) NSString *feeltitle;
@property (nonatomic, strong) NSArray *imgs;
@property (nonatomic, assign) NSInteger islongtime;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSString *questionURL;

@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *shareURL;
@property (nonatomic, assign) NSInteger startdate;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *telephone;
@property (nonatomic, strong) NSString *mobileURL;

@property (nonatomic, strong) NSString *adurl;


+ (instancetype)eventsItemWithDict:(NSDictionary *)dict;

@end

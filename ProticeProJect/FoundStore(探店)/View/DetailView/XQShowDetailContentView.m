//
//  XQShowDetailContentView.m
//  ProticeProJect
//
//  Created by 弓虽_子 on 16/5/12.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQShowDetailContentView.h"

#import "XQEventsItem.h"

@interface XQShowDetailContentView()
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation XQShowDetailContentView


+ (instancetype)showDetailContentView {
    return  [[[NSBundle mainBundle] loadNibNamed:@"XQShowDetailContentView" owner:nil options:nil]lastObject];
}

- (IBAction)correctBtnClick:(id)sender {
}
- (IBAction)phoneClick:(id)sender {
}


- (void)setEvents:(XQEventsItem *)events {
    _events = events;
    self.shopName.text = events.remark;
    self.phoneNumber.text = events.telephone;
    self.addressLabel.text = events.address;
}


@end

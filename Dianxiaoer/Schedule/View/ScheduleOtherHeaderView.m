//
//  ScheduleOtherHeaderView.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/22.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ScheduleOtherHeaderView.h"

@implementation ScheduleOtherHeaderView
- (IBAction)dayBtnClick:(id)sender {
    [self.delegate dayCellSelect:sender];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

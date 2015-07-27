//
//  PaySuccessAlertView.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "PaySuccessAlertView.h"

@implementation PaySuccessAlertView
- (IBAction)submitBtnClick:(id)sender {
    [self removeFromSuperview];
    [self.delegate toNextVC];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

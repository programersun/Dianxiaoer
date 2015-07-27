//
//  SubmitSuccessView.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/26.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "SubmitSuccessView.h"

@implementation SubmitSuccessView
- (IBAction)telBtnClick:(id)sender {
    [self.delegate telBtnClick];
}
- (IBAction)submitSuccessBtnClick:(id)sender {
    [self removeFromSuperview];
    [self.delegate submitSuccessBtnClick];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

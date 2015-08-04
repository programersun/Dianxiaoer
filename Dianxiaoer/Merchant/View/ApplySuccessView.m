//
//  ApplySuccessView.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/4.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ApplySuccessView.h"

@implementation ApplySuccessView
- (IBAction)telBtnClick:(id)sender {
    [self.delegate telBtnClick];
}
- (IBAction)submitBtnClick:(id)sender {
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

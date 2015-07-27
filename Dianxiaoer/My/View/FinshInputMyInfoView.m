//
//  FinshInputMyInfoView.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "FinshInputMyInfoView.h"

@interface FinshInputMyInfoView () <FinshInputMyInfoViewDelegate>

@end

@implementation FinshInputMyInfoView
- (IBAction)backBtnClick:(id)sender {
    [self removeFromSuperview];
    
}

- (IBAction)yueBtnClick:(id)sender {
    
}
- (IBAction)inputBtnClick:(id)sender {
    [self.delegate toUpLoadIDVC];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

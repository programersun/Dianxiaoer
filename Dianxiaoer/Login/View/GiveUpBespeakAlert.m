//
//  GiveUpBespeakAlert.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "GiveUpBespeakAlert.h"

@implementation GiveUpBespeakAlert


- (IBAction)submitBtnClick:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)toRootViewBtnClick:(id)sender {
    [self removeFromSuperview];
    [self.delegate toRootVC];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  ModifyView.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/26.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ModifyView.h"

@implementation ModifyView

- (IBAction)submitBtnClick:(id)sender {
    [self removeFromSuperview];
    [self.delegate submitBtnClick];
}

- (IBAction)cancelBtnClick:(id)sender {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

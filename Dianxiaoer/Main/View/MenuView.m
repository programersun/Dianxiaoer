//
//  MenuView.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)closeMenuAction:(id)sender {
    [self removeFromSuperview];
}
- (IBAction)toDateBtnClick:(id)sender {
    [self removeFromSuperview];
    [[self delegate] toDateVC];
}

- (IBAction)toAccountBtnClick:(id)sender {
    [self removeFromSuperview];
    [[self delegate] toAccountVC];
}

- (IBAction)toWorkClick:(id)sender {
    [self removeFromSuperview];
    [[self delegate] toMessageVC];
}

@end

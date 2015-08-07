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

- (void)changeLayOut {

    _menuBtnWidth.constant = _menuBtnWidth.constant * HEIGHTCHANGE;
    _menuBtnHeight.constant = _menuBtnHeight.constant * HEIGHTCHANGE;
    
    _dateBtnWidth.constant = _dateBtnWidth.constant * HEIGHTCHANGE;
    _dateBtnHeight.constant = _dateBtnHeight.constant * HEIGHTCHANGE;
    
    _accountBtnWidth.constant = _accountBtnWidth.constant * HEIGHTCHANGE;
    _accountBtnHeight.constant = _accountBtnHeight.constant * HEIGHTCHANGE;
    
    _releaseBtnWidth.constant = _releaseBtnWidth.constant * HEIGHTCHANGE;
    _releaseBtnHeight.constant = _releaseBtnHeight.constant * HEIGHTCHANGE;
    
    _dateRightBtnWidth.constant = _dateRightBtnWidth.constant * HEIGHTCHANGE;
    _dateRightBtnHeight.constant = _dateRightBtnHeight.constant * HEIGHTCHANGE;
    
    _accountRightBtnWidth.constant = _accountRightBtnWidth.constant * HEIGHTCHANGE;
    _accountRightBtnHeight.constant = _accountRightBtnHeight.constant * HEIGHTCHANGE;
    
    _releaseRightBtnWidth.constant = _releaseRightBtnWidth.constant * HEIGHTCHANGE;
    _releaseRightBtnHeight.constant = _releaseRightBtnHeight.constant * HEIGHTCHANGE;
    
    _closeBtnWidth.constant = _closeBtnWidth.constant * HEIGHTCHANGE;
    _closeBtnHeight.constant = _closeBtnHeight.constant * HEIGHTCHANGE;
    
    _yellowLineWidth.constant = _yellowLineWidth.constant * HEIGHTCHANGE;
    _yellowLineHeight.constant = _yellowLineHeight.constant * HEIGHTCHANGE;
    
    _dateBtnButtom.constant = _dateBtnButtom.constant * HEIGHTCHANGE;
    _accountBtnButtom.constant = _accountBtnButtom.constant * HEIGHTCHANGE;
    _releaseBtnButtom.constant = _releaseBtnButtom.constant * HEIGHTCHANGE;
    _yellowLineButtom.constant = _yellowLineButtom.constant * HEIGHTCHANGE;
}

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

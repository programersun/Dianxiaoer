//
//  MenuView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  MenuViewDelegate

@optional
- (void)toMessageVC;
@optional
- (void)toAccountVC;
@optional
- (void)toDateVC;

@end

@interface MenuView : UIView
@property (nonatomic, assign) id <MenuViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuBtnHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateBtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateBtnButtom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accountBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accountBtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accountBtnButtom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *releaseBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *releaseBtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *releaseBtnButtom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateRightBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateRightBtnHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accountRightBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accountRightBtnHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *releaseRightBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *releaseRightBtnHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeBtnHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yellowLineWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yellowLineHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yellowLineButtom;

- (void)changeLayOut;

@end

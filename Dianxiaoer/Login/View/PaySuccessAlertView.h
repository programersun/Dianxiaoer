//
//  PaySuccessAlertView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  paySuccessAlertViewDelegate

@optional
- (void)toNextVC;

@end
@interface PaySuccessAlertView : UIView
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *alertImgView;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property (nonatomic, assign) id <paySuccessAlertViewDelegate> delegate;
@end

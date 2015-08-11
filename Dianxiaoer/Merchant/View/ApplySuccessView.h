//
//  ApplySuccessView.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/4.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ApplySuccessViewDelegate
@optional
-(void)submitSuccessBtnClick;
@optional
-(void)telBtnClick;
@end

@interface ApplySuccessView : UIView

@property (nonatomic, assign) id<ApplySuccessViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *telBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@end

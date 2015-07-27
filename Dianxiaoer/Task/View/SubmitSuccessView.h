//
//  SubmitSuccessView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/26.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubmitSuccessViewDelegate
@optional
-(void)submitSuccessBtnClick;
@optional
-(void)telBtnClick;
@end

@interface SubmitSuccessView : UIView
@property (nonatomic, assign) id<SubmitSuccessViewDelegate> delegate;
@end

//
//  ModifyView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/26.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModifyViewDelegate
@optional
-(void)submitBtnClick;

@end

@interface ModifyView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;


@property (nonatomic, assign) id<ModifyViewDelegate> delegate;
@end

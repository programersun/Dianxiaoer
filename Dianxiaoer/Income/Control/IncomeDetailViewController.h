//
//  IncomeDetailViewController.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/7.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncomeDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *detailScrollImg;
@property (weak, nonatomic) IBOutlet UIButton *withdrewBtn;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UIView *detailHeadView;
@property (weak, nonatomic) IBOutlet UIImageView *detailHeadViewImg;

@end

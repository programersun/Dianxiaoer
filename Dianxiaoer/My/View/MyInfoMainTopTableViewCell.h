//
//  MyInfoMainTopTableViewCell.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyInfoMainTopTableViewCellDelegate <NSObject>

@optional
- (void)scrollDown:(CGFloat)yOff;
@optional
- (void)myInfoBackBtnClick;
@optional
- (void)modfiyBtnClick;

@end

@interface MyInfoMainTopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *upBackgroundView;
@property (weak, nonatomic) IBOutlet UIScrollView *upScrollView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *modfiyBtn;
@property (nonatomic, assign) id<MyInfoMainTopTableViewCellDelegate> delegate;

@end

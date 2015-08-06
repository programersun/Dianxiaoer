//
//  MyInfoMainButtomTableViewCell.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyInfoMainButtomTableViewCellDelegate <NSObject>

@optional
- (void)scrollUp:(CGFloat)yOff;

@end

@interface MyInfoMainButtomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *buttomScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *buttomBackgroundImg;
@property (nonatomic, assign) id<MyInfoMainButtomTableViewCellDelegate> delegate;
@end

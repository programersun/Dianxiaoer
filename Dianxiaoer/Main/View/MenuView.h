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
@end

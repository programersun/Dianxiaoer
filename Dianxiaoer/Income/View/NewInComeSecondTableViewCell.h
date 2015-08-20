//
//  NewInComeSecondTableViewCell.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  NewInComeSecondTableViewCellDelegate

@optional
- (void)toBankCardVC;
- (void)toWithrewVC;
- (void)toInComeDetailVC;

@end

@interface NewInComeSecondTableViewCell : UITableViewCell
@property (nonatomic, assign) id <NewInComeSecondTableViewCellDelegate> delegate;
@end

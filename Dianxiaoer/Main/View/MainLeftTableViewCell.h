//
//  MainLeftTableViewCell.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/15.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainLeftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *centerLine;

@property (weak, nonatomic) IBOutlet UIView *infoView;

@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UILabel *infoWorkLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoDistanceLabel;

@end

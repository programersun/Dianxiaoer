//
//  BuyCollectionViewCell.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/23.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "BuyCollectionViewCell.h"

@implementation BuyCollectionViewCell
- (IBAction)headBtnClick:(id)sender {
    [self.delegate headImgClick];
}
- (IBAction)moreDayBtnClick:(id)sender {
    [self.delegate chooseDay];
}

@end

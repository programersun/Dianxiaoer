//
//  BidDetailHeaderView.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/26.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "BidDetailHeaderView.h"

@implementation BidDetailHeaderView
- (IBAction)bidHeaderClick:(id)sender {
    [self.delegate bidDetailHeaderClick:sender];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  NewInComeSecondTableViewCell.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "NewInComeSecondTableViewCell.h"

@implementation NewInComeSecondTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)withdrewBtnClick:(id)sender {
    [self.delegate toWithrewVC];
}
- (IBAction)bankCardBtnClick:(id)sender {
    [self.delegate toBankCardVC];
}
- (IBAction)inComeDetailBtnClick:(id)sender {
    [self.delegate toInComeDetailVC];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

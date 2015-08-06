//
//  ScheduleDetailButtomTableViewCell.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ScheduleDetailButtomTableViewCell.h"

@interface ScheduleDetailButtomTableViewCell () <UIScrollViewDelegate>

@end

@implementation ScheduleDetailButtomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)scrollLeftBtnClick:(id)sender {
    
}
- (IBAction)scrollRightBtnClick:(id)sender {
    
}
- (IBAction)moreWorkBtnClick:(id)sender {
    [self.delegate moreWorkBtnClick];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y >= scrollView.contentSize.height - SCREENHEIGHT) {
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentSize.height - SCREENHEIGHT) animated:NO];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.delegate scrollUp:scrollView.contentOffset.y];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

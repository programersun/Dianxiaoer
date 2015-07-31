//
//  ReleasePickerView.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/7/31.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ReleasePickerViewDelegate

@optional
- (void)reloadCell:(NSString *)chooseString;

@end

typedef enum {
    ChooseAddress,
    ChoosePosition
}PickerStyle;

@interface ReleasePickerView : UIView
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *releasePicker;
@property (weak, nonatomic) IBOutlet UIView *pickerBackgroundView;
@property PickerStyle pickerStyle;

@property (nonatomic, assign) id<ReleasePickerViewDelegate> delegate;
- (id)initWithStyle:(PickerStyle)pickerStyle delegate:(id <ReleasePickerViewDelegate>) delegate;
- (void)showInView:(UIView *)view;
- (void)cancelPicker;
@end

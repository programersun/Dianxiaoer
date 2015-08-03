//
//  ReleasePickerView.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/7/31.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZLocation.h"

@class ReleasePickerView;

@protocol  ReleasePickerViewDelegate <NSObject>

- (void)pickerDidChaneStatus:(ReleasePickerView *)picker;
@end

typedef enum {
    ChooseAddress,
    ChoosePosition,
    ChooseTime
}PickerStyle;

@interface ReleasePickerView : UIView
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *releasePicker;
@property (weak, nonatomic) IBOutlet UIView *pickerBackgroundView;
@property PickerStyle pickerStyle;

@property NSString *timeStart;
@property NSString *timeEnd;
@property NSString *timeCount;

@property NSString *position;

@property (nonatomic, assign) id<ReleasePickerViewDelegate> delegate;
- (id)initWithStyle:(PickerStyle)pickerStyle delegate:(id <ReleasePickerViewDelegate>) delegate;

@property (strong, nonatomic) HZLocation *locate;
- (void)showInView:(UIView *)view;
- (void)cancelPicker;
@end

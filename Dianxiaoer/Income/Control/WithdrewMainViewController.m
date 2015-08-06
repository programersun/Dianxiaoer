//
//  WithdrewMainViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "WithdrewMainViewController.h"
#import "WithdrewSuccessViewController.h"
#import "ChooseBankCardView.h"

@interface WithdrewMainViewController () <ChooseBankCardViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *chooseBankCardBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property (nonatomic, strong) ChooseBankCardView *chooseBankCardView;

@end

@implementation WithdrewMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_chooseBankCardBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_submitBtn];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)submitBtnClick:(id)sender {
    WithdrewSuccessViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"WithdrewSuccessViewController"];
    if (vc == nil) {
        vc = [[WithdrewSuccessViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
    
}

- (IBAction)chooseBankCardBtnClick:(id)sender {
    [self chooseBankCardAppear];
}

- (void)chooseBankCardAppear {
    UINib *nib = [UINib nibWithNibName:@"ChooseBankCardView" bundle:nil];
    _chooseBankCardView = [nib instantiateWithOwner:nil options:nil][0];
    _chooseBankCardView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseBankCardDisAppear)];
    [_chooseBankCardView.backgroundView addGestureRecognizer:backTouch];
    _chooseBankCardView.delegate = self;
    [self changeFrame:HEIGHTCHANGE withObjcet:_chooseBankCardView.backgroundView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_chooseBankCardView.chooseImg];
    [self.view addSubview:_chooseBankCardView];
}

- (void)chooseBankCardDisAppear {
    [_chooseBankCardView removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

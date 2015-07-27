//
//  MyInfoViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myInfoScrollView;

@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"MyInfo"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    _myInfoScrollView.contentSize = img.size;
    [_myInfoScrollView addSubview:imgView];
    
    // Do any additional setup after loading the view.
}

- (IBAction)backClick:(id)sender {
    [self backBtnClick];
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

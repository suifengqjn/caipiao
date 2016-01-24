//
//  MyProfileViewController.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/5.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "MyProfileViewController.h"
#import "CPSettingViewController.h"
@interface MyProfileViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:UIBarButtonItemStyleDone target:self action:@selector(barButtonItemACtion:)];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    [_loginButton setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButton"] forState:UIControlStateNormal];
    
    [_loginButton setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    
}
- (IBAction)login:(UIButton *)sender {
    

}

- (void)barButtonItemACtion:(UIBarButtonItem *)item
{
    CPSettingViewController *setVC = [[CPSettingViewController alloc] init];
    [self.navigationController pushViewController:setVC animated:YES];
}
@end

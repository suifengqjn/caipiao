//
//  XCNavigationController.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/5.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "XCNavigationController.h"

@interface XCNavigationController ()

@end

@implementation XCNavigationController

// 第一次使用这个类或者这个类的子类的时候
+ (void)initialize
{
    if (self == [XCNavigationController class]) { // 肯定能保证只调用一次
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *navImage = nil;
    if (IOS7) {
        navImage = [UIImage imageNamed:@"NavBar64"];
    }else{
        navImage = [UIImage imageNamed:@"NavBar"];
    }
    [self.navigationBar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    
    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:15.0]
                           };
    [self.navigationBar setTitleTextAttributes:dict];

}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
}

@end

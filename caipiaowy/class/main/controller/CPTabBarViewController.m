//
//  CPTabBarViewController.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/4.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPTabBarViewController.h"
#import "CPTabBar.h"
#import "UIView+XCAdditions.h"
@interface CPTabBarViewController ()<CPTabBarDelegate>

@end

@implementation CPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 移除自带的tabBar
    [self.tabBar removeFromSuperview];
    
    NSLog(@"%@",self.tabBar);
    // 创建tabBar
    CPTabBar *tabBar = [[CPTabBar alloc] init];
    
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.frame;
    
    [self.view addSubview:tabBar];

    
}

#pragma mark - CPTabBarDelegate
- (void)tabBar:(CPTabBar *)tabBar didSelectedIndex:(NSInteger)index
{
    self.selectedIndex = index;
    NSLog(@"%ld", index);
}
@end

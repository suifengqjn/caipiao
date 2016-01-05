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
    
    
    NSLog(@"%@",self.tabBar);
    // 创建tabBar
    CPTabBar *tabBar = [[CPTabBar alloc] init];
    tabBar.itemCount = self.childViewControllers.count;
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:tabBar];
    
    NSString *imageName = nil;
    
    NSString *selImageName = nil;
    
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        imageName = [NSString stringWithFormat:@"TabBar%ld",i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%ldSel",i + 1];
        [tabBar addTabBarButtonWithImageName:imageName selImageName:selImageName];
    }

    
}

#pragma mark - CPTabBarDelegate
- (void)tabBar:(CPTabBar *)tabBar didSelectedIndex:(NSInteger)index
{
    self.selectedIndex = index;
    NSLog(@"%ld", index);
}
@end

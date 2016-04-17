//
//  XMGMainController.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGMainController.h"
#import "XMGLotteryController.h"
#import "XMGSportsAreaController.h"
#import "XMGDiscoveryController.h"
#import "XMGAwardInfoController.h"
#import "XMGMineController.h"

#import "XMGTabbar.h"
#import "XMGNaviController.h"
@interface XMGMainController()<XMGTabbarDelegate>
@end

// 用UIImageRenderingModeAlwaysOriginal方式来创建,不然有系统着色
//    UIImage *imageNormal1 = [UIImage imageNamed:normal];
//    imageNormal1 = [imageNormal1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    UIImage *imageSel1 = [UIImage imageNamed:sel];
//    imageSel1 = [imageSel1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:imageNormal1 selectedImage:imageSel1];
//    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
@implementation XMGMainController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
//    self.tabBar.translucent = NO;
//    self.tabBar.tintColor = [UIColor redColor];
    
    // 1.创建购彩大厅控制器
    XMGLotteryController *vc1 = [[XMGLotteryController alloc]init];
    [self addChildVcWithController:vc1 Str:@"tab01" SelStr:@"tab01Sel" ];
    
    // 2.创建竞技场控制器
    XMGSportsAreaController *vc2 = [[XMGSportsAreaController alloc]init];
    [self addChildVcWithController:vc2 Str:@"tab02" SelStr:@"tab02Sel" ];
    
    // 3.创建发现控制器
    XMGDiscoveryController *vc3 = [[XMGDiscoveryController alloc]init];
    [self addChildVcWithController:vc3 Str:@"tab03" SelStr:@"tab03Sel" ];

    // 4.创建开奖信息控制器
    XMGAwardInfoController *vc4 = [[XMGAwardInfoController alloc]init];
    [self addChildVcWithController:vc4 Str:@"tab04" SelStr:@"tab04Sel" ];
    
    // 5.创建我的控制器
    XMGMineController *vc5 = [[XMGMineController alloc]init];
    [self addChildVcWithController:vc5 Str:@"tab05" SelStr:@"tab05Sel" ];
    
    // 6.创建自定义的tabbarItem
    XMGTabbar *bar = [[XMGTabbar alloc]init];
    bar.frame = self.tabBar.bounds;
    bar.backgroundColor = [UIColor blackColor];
    [self.tabBar addSubview:bar];
    
    // 设置代理
    bar.delegate = self;

    for (NSInteger i = 1; i <=5 ; i++) {
        [bar addItemWithImage:[NSString stringWithFormat:@"tab0%zd",i] selImage:[NSString stringWithFormat:@"tab0%zdSel",i]];
    }
}

#pragma mark - 私有方法 生成带有tabbarItem的子控制器
- (void)addChildVcWithController:(UIViewController *)vc Str:(NSString *)normal SelStr:(NSString *)sel
{
    // 1.设置背景色
    vc.view.backgroundColor = [UIColor whiteColor];
    
    // 2.将系统创建的按钮的enable设置为NO,点击事件,向下传递
    vc.tabBarItem.enabled = NO;
    
    // 3.给每一个子控制器封装一个导航栏
    XMGNaviController *navi = [[XMGNaviController alloc]initWithRootViewController:vc];
    navi.tabBarItem.enabled = NO;
    
    // 4.添加子控制器
    [self addChildViewController:navi];
}

// 生成随机色
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}
#pragma mark - XMGTabbarDelegate
- (void)tabbar:(XMGTabbar *)bar clickFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}
@end

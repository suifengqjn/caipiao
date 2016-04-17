//
//  XMGNaviController.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGNaviController.h"


@interface XMGNaviController ()
@end
@implementation XMGNaviController
// 该方法在类被引用的时候就会调用一次,仅会调用一次
+ (void)initialize
{
    // 1.获取全局的统一样式的导航栏
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // 1.1设导航栏的标题的样式
    [bar setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName : [UIColor whiteColor],
                                  NSFontAttributeName : [UIFont systemFontOfSize:18]
                                  }];
    // 1.2设置bar的tintColor
    bar.tintColor = [UIColor whiteColor];
    
    // 2.1 设置导航栏按钮的样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 2.2 设置普通状态的样式
    [item setTitleTextAttributes:@{
                                  NSFontAttributeName : [UIFont systemFontOfSize:14],
                                  NSForegroundColorAttributeName : [UIColor whiteColor]
                                  } forState:UIControlStateNormal];
    // 2.3 设置高亮状态的样式
    [item setTitleTextAttributes:@{
                                   NSFontAttributeName : [UIFont systemFontOfSize:14],
                                   NSForegroundColorAttributeName : [UIColor whiteColor]
                                   } forState:UIControlStateHighlighted];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end

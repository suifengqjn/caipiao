//
//  XMGSportsAreaController.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGSportsAreaController.h"

@implementation XMGSportsAreaController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    UIButton *add = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:add];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"竞技场";
}
@end

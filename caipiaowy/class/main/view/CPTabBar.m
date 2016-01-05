//
//  CPTabBar.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/4.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPTabBar.h"
#import "CPTabBarButton.h"

//tabbar 控制器数量
#define tabBarItemCount 5

@interface CPTabBar ()

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation CPTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // 添加按钮
        [self addBtns];
        
    }
    return self;
}


- (void)addBtns
{
    
    NSString *imageName = nil;
    
    NSString *selImageName = nil;
    
    for (NSInteger i = 0; i < tabBarItemCount; i++) {
        CPTabBarButton *btn = [CPTabBarButton buttonWithType:UIButtonTypeCustom];
        // 绑定角标
        btn.tag = i;
        
        imageName = [NSString stringWithFormat:@"TabBar%ld",i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%ldSel",i + 1];
        
        // 设置按钮的图片
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        
        // 监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}

// 点击按钮的时候调用
- (void)btnClick:(UIButton *)button
{
    // 取消之前选择按钮
    _selectedButton.selected = NO;
    // 选中当前按钮
    button.selected = YES;
    // 记录当前选中按钮
    _selectedButton = button;
    
    // 切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedIndex:)]) {
        [_delegate tabBar:self didSelectedIndex:button.tag];
    }
    
}

#pragma mark -  设置按钮的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    // 设置按钮的尺寸
    for (int i = 0; i < tabBarItemCount; i++) {
        UIButton *btn = self.subviews[i];
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    
    
    
    
}


@end

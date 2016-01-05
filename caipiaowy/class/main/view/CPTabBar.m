//
//  CPTabBar.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/4.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPTabBar.h"
#import "CPTabBarButton.h"


@interface CPTabBar ()

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation CPTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)addTabBarButtonWithImageName:(NSString *)imageName selImageName:(NSString *)selImageName
{
    CPTabBarButton *btn = [CPTabBarButton buttonWithType:UIButtonTypeCustom];

    // 设置按钮的图片
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    
    // 监听按钮的点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
    // 默认选中第一个按钮
    

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
    for (int i = 0; i < _itemCount; i++) {
        UIButton *btn = self.subviews[i];
        btn.tag = i;
        //默认选中第一个
        if (i == 0) {
            [self btnClick:btn];
        }
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    
    
    
    
}


@end

//
//  XMGTabbarItem.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGTabbarItem.h"

@implementation XMGTabbarItem
+ (instancetype)itemWithImage:(NSString *)image selImage:(NSString *)selImage
{
    XMGTabbarItem *item = [[self alloc]init];
    [item setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:selImage] forState:UIControlStateSelected];
    
    return item;
}
// 不需要高亮状态的样式
- (void)setHighlighted:(BOOL)highlighted{}

@end

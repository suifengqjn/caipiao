//
//  XMGTabbar.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGTabbar.h"
#import "XMGTabbarItem.h"
@implementation XMGTabbar
{
    XMGTabbarItem *_selectItem;
}
- (void)addItemWithImage:(NSString *)image selImage:(NSString *)sel
{
    // 1. 创建子视图
    XMGTabbarItem *item = [XMGTabbarItem itemWithImage:image selImage:sel];
    // 1.1添加监听事件
    [item addTarget:self action:@selector(handleItemClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:item];
    
    // 2. 调整子视图的位置
    [self adjustChildViewFrame];
}

- (void)adjustChildViewFrame
{
    NSArray *array = self.subviews;
    
    CGFloat width = self.frame.size.width /array.count;
    
    for (NSInteger i = 0; i < array.count; i++) {
        XMGTabbarItem *item = array[i];
        item.frame = CGRectMake(i * width, 0, width, self.frame
                                .size.height);
        item.tag = i;
        // 默认第一个按钮式选中状态
        if (i == 0) {
            item.selected = YES;
            _selectItem = item;
        }
    }
}
// 监听事件
- (void)handleItemClick:(XMGTabbarItem *)item
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabbar:clickFrom:to:)]) {
        [self.delegate tabbar:self clickFrom:_selectItem.tag to:item.tag];
    }
    
    _selectItem.selected = NO;
    item.selected = YES;
    _selectItem = item;
    
}
@end

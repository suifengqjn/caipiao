//
//  XMGHallFocusCollectionCell.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGHallFocusCollectionCell.h"

@implementation XMGHallFocusCollectionCell
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建imageView
        self.imageView = [[UIImageView alloc]init];
        
        self.imageView.frame  = self.bounds;

        [self.contentView addSubview:self.imageView];
    }
    return self;
}
// 调整子数图的大小和位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}
@end

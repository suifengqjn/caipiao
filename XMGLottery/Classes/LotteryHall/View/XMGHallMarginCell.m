//
//  XMGHallMarginCell.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/13.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGHallMarginCell.h"

@implementation XMGHallMarginCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 1.设置cell的背景色
        self.backgroundColor = GlobeColor;
        
        // 2.设置点击样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 3.调整cell的分割线
        self.separatorInset = UIEdgeInsetsZero;
        if ([self respondsToSelector:@selector(layoutMargins)]) {
            self.layoutMargins = UIEdgeInsetsZero;
        }
    }
    return self;
}


@end

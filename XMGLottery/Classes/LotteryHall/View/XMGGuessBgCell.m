//
//  XMGGuessBgCell.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGGuessBgCell.h"

@implementation XMGGuessBgCell
+ (NSString *)nibName
{
    return @"XMGGuessBgCell";
}
- (void)awakeFromNib {
    
    self.clipsToBounds = YES;
    self.imageViewBg.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

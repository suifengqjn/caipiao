//
//  XMGGuessCell.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGGuessCell.h"

@implementation XMGGuessCell
+ (NSString *)nibName
{
    return @"XMGGuessCell";
}

- (IBAction)changeBtnClick:(id)sender {
    // 回调代理
    if ([self.delegate respondsToSelector:@selector(cellDidClickChangeBtn:)]) {
        [self.delegate cellDidClickChangeBtn:self];
    }
}

@end

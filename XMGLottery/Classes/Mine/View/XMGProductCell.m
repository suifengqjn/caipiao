//
//  XMGProductCell.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/17.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGProductCell.h"

@implementation XMGProductCell
+ (NSString *)nibName
{
    return @"XMGProductCell";
}

- (IBAction)downLoadBtnClicked:(UIButton *)sender {
    // 通过代理点击了下载按钮
    if ([self.delegate respondsToSelector:@selector(celldidSelectDownloadButton:)]) {
        [self.delegate celldidSelectDownloadButton:self];
    }
}

@end

//
//  XMGChooseView.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGChooseView.h"

@implementation XMGChooseView
+ (instancetype)viewChoose
{
    return [[NSBundle mainBundle] loadNibNamed:@"XMGChooseView" owner:nil options:nil][0];
}


@end

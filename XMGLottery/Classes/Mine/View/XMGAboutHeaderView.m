//
//  XMGAboutHeaderView.m
//  备课-网易新闻
//
//  Created by 王峰 on 15/7/20.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGAboutHeaderView.h"

@implementation XMGAboutHeaderView
+ (instancetype)view
{
    return [[NSBundle mainBundle] loadNibNamed:@"XMGAboutHeaderView" owner:nil options:nil][0];
}

// 为什么要提供一个接口返回xib文件名?
// 1.谁最清楚xib文件名,是不是咱们这个XMGAboutHeaderView文件.所以我的类名,你想知道,是不是应该提供一个借口接口告诉控制器啊
// 2.提供一个借口的好处?下次,如果要改动动了xib文件名,我们只需要在这个方法里面把对应的返回值改一下就可以了.不用再控里面到处改啊,改很多处,那样改的话就非常恶心.

// 从对象的作用(控制器),以及代码的维护性,讲解这个问题.

+ (NSString *)nibName
{
    return @"XMGAboutHeaderView";
}
@end

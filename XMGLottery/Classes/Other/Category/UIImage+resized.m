//
//  UIImage+resized.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "UIImage+resized.h"

@implementation UIImage (resized)
- (instancetype)imageWithEdgeinset:(UIEdgeInsets )inset
{
    return [self resizableImageWithCapInsets:inset];
}

- (instancetype)resizeImage
{
    return [self imageWithEdgeinset:UIEdgeInsetsMake(10, 10, 10, 10)];
}
@end

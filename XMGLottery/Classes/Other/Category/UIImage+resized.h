//
//  UIImage+resized.h
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (resized)
// 指定拉伸模式的方法
- (instancetype)imageWithEdgeinset:(UIEdgeInsets )inset;
// 快捷的创建不被拉伸图片的方法
- (instancetype)resizeImage;
@end

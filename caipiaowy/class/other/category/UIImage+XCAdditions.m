//
//  UIImage+XCAdditions.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/5.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "UIImage+XCAdditions.h"

@implementation UIImage (XCAdditions)

+ (instancetype)imageWithResizableImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    image =  [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    return image;
}

@end

//
//  XMGSettingModel.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGSettingModel.h"

@implementation XMGSettingModel
+ (instancetype)initWithImage:(NSString *)image title:(NSString *)title type:(XMGSettingCellType)type
{
    XMGSettingModel *model = [[self alloc]init];
    model.image = image;
    model.title = title;
    model.type = type;
    
    return model;
}
+ (instancetype)initWithTitle:(NSString *)title type:(XMGSettingCellType)type
{
    return [self initWithImage:nil title:title type:type];
}
@end

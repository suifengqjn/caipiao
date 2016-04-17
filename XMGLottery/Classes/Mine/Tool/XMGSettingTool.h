//
//  XMGSettingTool.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//  用来读取和存储用户的偏好设置

#import <Foundation/Foundation.h>

@interface XMGSettingTool : NSObject
+ (void)setObject:( id)value forKey:(NSString *)defaultName;
+ (id)objectForKey:(NSString *)defaultName;

+ (BOOL)boolForKey:(NSString *)defaultName;
+ (void)setBool:(BOOL)Bool forKey:(NSString *)defaultName;
@end

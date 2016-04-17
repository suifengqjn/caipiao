//
//  XMGSettingTool.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.


#import "XMGSettingTool.h"
#define XMGUserDefault [NSUserDefaults standardUserDefaults]
@implementation XMGSettingTool
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [XMGUserDefault setObject:value forKey:defaultName];
}
+ (id)objectForKey:(NSString *)defaultName
{
    return [XMGUserDefault objectForKey:defaultName];
}
+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [XMGUserDefault boolForKey:defaultName];
}
+ (void)setBool:(BOOL)Bool forKey:(NSString *)defaultName
{
    return[XMGUserDefault setBool:Bool forKey:defaultName];
}
@end

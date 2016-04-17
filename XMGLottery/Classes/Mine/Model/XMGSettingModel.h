//
//  XMGSettingModel.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//  用来描述每一个cell是什么样子的

#import <Foundation/Foundation.h>
typedef enum {
    XMGSettingCellTypeArrow,
    XMGSettingCellTypeSwitch,
    XMGSettingCellTypeLabel,
    XMGSettingCellTypeNone
}XMGSettingCellType;
@interface XMGSettingModel : NSObject
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) XMGSettingCellType type; //用来描述每一个cell右边是什么样子的
@property (nonatomic, copy) void(^action)();
@property (nonatomic, copy) NSString *rightTitle; // 显示右边的文字
@property (nonatomic, copy) NSString *subTitle; // 子标题
@property (nonatomic, copy) NSString *key; // 用来读取和存储用户的偏好信息
+ (instancetype)initWithImage:(NSString *)image title:(NSString *)title type:(XMGSettingCellType)type;
+ (instancetype)initWithTitle:(NSString *)title type:(XMGSettingCellType)type;
@end

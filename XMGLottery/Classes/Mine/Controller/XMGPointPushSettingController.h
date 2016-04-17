//
//  XMGPointPushSettingController.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGBaseSettingController.h"
@class XMGPointPushSettingController;
@protocol XMGPointPushSettingControllerDelegate <NSObject>
@optional;
- (void)Vc:(XMGPointPushSettingController *)vc dateDidChange:(NSString *)date;
@end
@interface XMGPointPushSettingController : XMGBaseSettingController
@property (nonatomic, weak) id<XMGPointPushSettingControllerDelegate>delegate;
@end

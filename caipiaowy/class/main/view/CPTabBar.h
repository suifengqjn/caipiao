//
//  CPTabBar.h
//  caipiaowy
//
//  Created by qianjianeng on 16/1/4.
//  Copyright © 2016年 CP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPTabBar;
@protocol CPTabBarDelegate <NSObject>

@optional

- (void)tabBar:(CPTabBar *)tabBar didSelectedIndex:(NSInteger)index;

@end

@interface CPTabBar : UIView

@property (nonatomic, weak) id<CPTabBarDelegate> delegate;
@property (nonatomic, assign) NSInteger itemCount;

//给外界创建按钮
- (void)addTabBarButtonWithImageName:(NSString *)imageName selImageName:(NSString *)selImageName;

@end

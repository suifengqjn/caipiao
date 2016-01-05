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

@end

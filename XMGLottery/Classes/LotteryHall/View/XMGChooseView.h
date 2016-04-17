//
//  XMGChooseView.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGChooseView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelSubTitle;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewArrow;
+ (instancetype)viewChoose;
@end

//
//  XMGProductCell.h
//  XMGLottery
//
//  Created by 王峰 on 15/8/17.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGProductCell, XMGProductModel;
@protocol XMGProductCellDelegate <NSObject>
@optional;
- (void)celldidSelectDownloadButton:(XMGProductCell *)cell;
@end
@interface XMGProductCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelDes;
@property (strong, nonatomic) IBOutlet UIButton *btnDownload;
@property (nonatomic, strong) XMGProductModel *model;
@property (nonatomic, weak) id<XMGProductCellDelegate>delegate;
+ (NSString *)nibName;
@end

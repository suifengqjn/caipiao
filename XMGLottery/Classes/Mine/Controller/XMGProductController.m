//
//  XMGProductController.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/17.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGProductController.h"

#import "XMGProductCell.h"
#import "XMGProductModel.h"
@interface XMGProductController ()<XMGProductCellDelegate>
{
    NSArray *_dataArray;
}

@end

@implementation XMGProductController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 基本设置
    self.collectionView.backgroundColor = GlobeColor;
    self.title = @"其他产品推荐";

    UINib *nib = [UINib nibWithNibName:[XMGProductCell nibName] bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    // 将json转换成数组或者字典
    NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    // 将数组转化成模型对象
    NSMutableArray *temp = [NSMutableArray array];
    
    for (NSInteger i = 0; i < array.count; i++) {
        NSDictionary *dict = array[i];
        XMGProductModel *model = [XMGProductModel initWithDict:dict];

        // 将创建好的model对象放入临时数组
        [temp addObject:model];
    }
    _dataArray = temp;
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XMGProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    XMGProductModel *model = _dataArray[indexPath.item];
    
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.labelName.text = model.title;
    cell.labelDes.text = model.stitle;
    cell.delegate = self;
    cell.model = model;
    
    // 自定义跳转路径的格式
    // 协议头://路径
    // customUrl://ID
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@",model.customUrl,model.ID];
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        // 用户已经下载了该应用
        [cell.btnDownload setBackgroundImage:[UIImage imageNamed:@"appadcell_openbutton"] forState:UIControlStateNormal];
    }else{
        // 用户没有下载改应用
        [cell.btnDownload setBackgroundImage:[UIImage imageNamed:@"appadcell_downloadbutton"] forState:UIControlStateNormal];
    }
    return cell;
}

#pragma mark - XMGProductCellDelegate
- (void)celldidSelectDownloadButton:(XMGProductCell *)cell
{
    XMGProductModel *model = cell.model;
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@",model.customUrl,model.ID];
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        // 用户已经下载了该应用
        [[UIApplication sharedApplication] openURL:url];
    }else{
        // 用户没有下载改应用
        NSURL *url = [NSURL URLWithString:model.url];
        [[UIApplication sharedApplication] openURL:url];
    }
}
@end

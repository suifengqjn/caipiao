//
//  XMGLotteryController.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGLotteryController.h"

#import "XMGHallFocusCell.h"

#import "XMGGuessBgCell.h"
#import "XMGGuessCell.h"
#import "XMGLotteryChoossCell.h"
#import "XMGHallMarginCell.h"

#import "XMGLotteryChooseModel.h"
#import "XMGLotteryChooseGroup.h"
static NSString *const ReusedFocusCellID = @"XMGHallFocusCell";
static NSString *const ReusedGuessCellID = @"XMGGuessCell";
static NSString *const ReusedGuessBgCellID = @"XMGGuessBgCell";
static NSString *const ReusedLotteryChooseCellID = @"XMGLotteryChoossCell";
static NSString *const ReusedMarginCellID = @"XMGHallMarginCell";
@interface XMGLotteryController ()<XMGGuessCellDelegate,XMGLotteryChooseCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end
@implementation XMGLotteryController
{
    // 焦点图图片数组
    NSArray *_focusImagesArray;
    // 猜你喜欢图片数组
    NSArray *_changeImagesArray;
    // 票中选择数组
    NSArray *_lotteryChooseArray;
    
    XMGGuessBgCell *_cellBg;
    
    // 记录抽屉的开关状态
    BOOL _is0pen;
}
- (void)loadView
{
    [super loadView];
    
    // 1.创建一个TableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 1.1调整cell的分割线
    tableView.separatorInset = UIEdgeInsetsZero;
    if ([tableView respondsToSelector:@selector(layoutMargins)]) {
        tableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
}
// 调整tableView的frame
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0.基本设置
    self.title = @"购彩大厅";
    self.tableView.backgroundColor = GlobeColor;
    // 1.加载数据
    [self loadData];
    // 2.注册重用cell
    [self registerReusedCell];
}
- (void)loadData
{
    // 1.加载焦点图图片资源
    NSMutableArray *temp1 = [NSMutableArray array];
    for (NSInteger i = 1; i <= 5; i++) {
        NSString *imageStr = [NSString stringWithFormat:@"ad%zd.jpg",i];
        [temp1 addObject:imageStr];
    }
    _focusImagesArray = temp1;
    
    // 2.加载焦点图图片资源
    NSMutableArray *temp2 = [NSMutableArray array];
    for (NSInteger i = 1; i <= 6; i++) {
        NSString *imageStr = [NSString stringWithFormat:@"page%zd",i];
        [temp2 addObject:imageStr];
    }
    _changeImagesArray = temp2;
    
    // 3.加载票中选择数组
    //3.1读取plist文件
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"List" ofType:@"plist"];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:dataPath];
    
    //3.2 将字典转换成模型对象
    // temp3对应的是外面的大数组
    NSMutableArray *temp3 = [NSMutableArray array];
    for (NSInteger i = 0; i < dataArray.count; i++) {
        NSArray *arraySub = dataArray[i];
        // temp4对应的是里面的小数组
        NSMutableArray *temp4 = [NSMutableArray array];
        
        // 创建group对象
        XMGLotteryChooseGroup *group = [[XMGLotteryChooseGroup alloc]init];
        
        // 将字典转换成模型对象
        for (NSInteger s = 0; s < arraySub.count; s++) {
            NSDictionary *dict = arraySub[s];
            XMGLotteryChooseModel *model = [XMGLotteryChooseModel modelWithDict:dict];
            [temp4 addObject:model];
        }
        group.models = temp4;
        
        [temp3 addObject:group];
    }
    _lotteryChooseArray = temp3;
}
- (void)registerReusedCell
{
    // 猜你喜欢
    UINib *nib0 = [UINib nibWithNibName:[XMGGuessCell nibName] bundle:nil];
    [self.tableView registerNib:nib0 forCellReuseIdentifier:ReusedGuessCellID];
    
    // 猜你喜欢背景图
    UINib *nib1 = [UINib nibWithNibName:[XMGGuessBgCell nibName] bundle:nil];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:ReusedGuessBgCellID];
}

#pragma mark - UITableView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3 + _lotteryChooseArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) { //焦点图
        return 1;
    }else if (section == 1){//猜你喜欢
        return 2;
    }else if (section == 2){//分割线
        return 1;
    }else{
        XMGLotteryChooseGroup *group = _lotteryChooseArray[section - 3];
        if (group.isOpen) { //抽屉式打开状态
            return (group.models.count - 1)/2 +1;
        }
        
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {// 0.返回焦点图的cell
        XMGHallFocusCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedFocusCellID];
        if (cell == nil) {
            cell = [[XMGHallFocusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReusedFocusCellID];
        }
        cell.imagesArray = _focusImagesArray;
        
        return cell;
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {// 1.返回猜你喜欢的cell
            XMGGuessCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedGuessCellID forIndexPath:indexPath];
            cell.delegate = self;
            return cell;
        }
        XMGGuessBgCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedGuessBgCellID forIndexPath:indexPath];
    
        NSString *imageStr = _changeImagesArray[cell.imageViewBg.tag % _changeImagesArray.count];
        cell.imageViewBg.image = [UIImage imageNamed:imageStr];
        
        _cellBg = cell;
        return cell;
    }else if (indexPath.section == 2){ // 显示分割线
        XMGHallMarginCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedMarginCellID];
        if (cell == nil) {
            cell = [[XMGHallMarginCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReusedMarginCellID];
        }
        
        return cell;
    }else{ //返回票种选择的cell
        XMGLotteryChoossCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedLotteryChooseCellID];
        if (cell == nil) {
            cell = [[XMGLotteryChoossCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReusedLotteryChooseCellID];
            cell.delegate = self;
        }
        // 取出对应的模型数组
        XMGLotteryChooseGroup *group = _lotteryChooseArray[indexPath.section -3];
        NSArray *array = group.models;
        // 数组索引
        NSInteger index0 = indexPath.row * 2;
        NSInteger index1 = index0 + 1;
        /**
         对最后一行进行判断,当数组长度为奇数的时候,最后一个cell只能够显示左边的视图,不能显示右边视图
         */
        if (index1 < array.count) {
            cell.rightView.hidden = NO;
            cell.line.hidden = NO;
            
            XMGLotteryChooseModel *model0 = array[index0];
            XMGLotteryChooseModel *model1 = array[index1];
            // 显示左边视图
            cell.leftView.imageView.image = [UIImage imageNamed:model0.image];
            cell.leftView.labelTitle.text = model0.title;
            cell.leftView.labelSubTitle.text = model0.subTitle;
            // 显示右边视图
            cell.rightView.imageView.image = [UIImage imageNamed:model1.image];
            cell.rightView.labelTitle.text = model1.title;
            cell.rightView.labelSubTitle.text = model1.subTitle;
            
            cell.leftModel = model0;
            cell.rightModel = model1;
        }else{
            XMGLotteryChooseModel *model0 = array[index0];
            // 显示左边视图
            cell.leftView.imageView.image = [UIImage imageNamed:model0.image];
            cell.leftView.labelTitle.text = model0.title;
            cell.leftView.labelSubTitle.text = model0.subTitle;
            // 隐藏右边视图
            cell.rightView.hidden = YES;
            cell.line.hidden = YES;
            
            // 记录住显示左右视图对应模型对象
            cell.leftModel = model0;
            cell.rightModel = nil;
        }
        
        // 更改背景色
        if (indexPath.row == 0) {
            cell.backgroundColor = [UIColor whiteColor];
        }else{
            cell.backgroundColor = GlobeColor;
        }
        cell.indexPath = indexPath;
        
        // 隐藏或者显示箭头
        cell.leftView.imageViewArrow.hidden = !group.isOpen;
        
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中背景色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    /**
//     思路:
//     1.判断抽屉之前的开关状态
//     2.打开或则关闭抽屉
//     抽屉有两种状态
//     打开状态:显示的cell个数由数据决定
//     关闭状态:显示的cell只有一个
//     */
//    if (indexPath.section >= 3) {
//        if (indexPath.row == 0) {
//            XMGLotteryChooseGroup *group = _lotteryChooseArray[indexPath.section - 3];
//            group.isOpen = !group.isOpen;
//            NSIndexSet *set = [NSIndexSet indexSetWithIndex:indexPath.section];
//            [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
//        }else{
//            // 跳到下一个页面
//        }
//    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {// 焦点图cell的高度
        // 屏幕宽度
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        return width/2;
    }else if (indexPath.section == 1){// 猜你喜欢cell的高度
        if (indexPath.row == 0) {
            return 30;
        }
        return 70;
    }else if (indexPath.section == 2){// 分割线cell的高度
        return 10;
    }else{
        return 70;
    }
}
#pragma mark - XMGGuessCellDelegate
- (void)cellDidClickChangeBtn:(XMGGuessCell *)cell
{
    /**
     思路:
     1.获取背景图cell当前显示的图片
     2.计算出下一张要显示的图片,并且让cell来显示
     3.添加背景图更换(切换)动画
     */
    //1.背景图cell更换一张背景图
    UIImageView *imageView = _cellBg.imageViewBg;
    imageView.tag ++;
    
    // 1.1获取下一张要显示的图片在数组中的索引
    NSInteger index = imageView.tag % _changeImagesArray.count;
    // 1.2出去图片名
    NSString *imageStr = _changeImagesArray[index];
    UIImage *image = [UIImage imageNamed:imageStr];
    imageView.image = image;
    
    // 2.定义动画
    CATransition *anim = [[CATransition alloc]init];
    // 设置转场类型
    anim.type = @"push";
    // 设置转场子类型
    anim.subtype = kCATransitionFromTop;
    // 设置时长
    anim.duration = 0.3;
    
    [imageView.layer addAnimation:anim forKey:nil];
    
}
#pragma mark - XMGLotteryChooseCellDelegate
- (void)choossCell:(XMGLotteryChoossCell *)cell didClickAtRightView:(BOOL)isRight
{
    if (isRight) {
        // 跳转到下一级控制器
        XMGLotteryChooseModel *model = cell.rightModel;
        // 创建控制器
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = GlobeColor;
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        // 打开/关闭抽屉
        /**
         思路:
         1.判断抽屉之前的开关状态
         2.打开或则关闭抽屉
         抽屉有两种状态
         打开状态:显示的cell个数由数据决定
         关闭状态:显示的cell只有一个
         */
        NSIndexPath *indexPath = cell.indexPath;
        if (indexPath.row == 0) {
            XMGLotteryChooseGroup *group = _lotteryChooseArray[indexPath.section - 3];
            group.isOpen = !group.isOpen;
            NSIndexSet *set = [NSIndexSet indexSetWithIndex:indexPath.section];
            [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
            
            if (group.isOpen) {
                // 调整tableView的位置,使抽屉里面的内容完全显示出来
                // tableView的偏移量
                CGFloat offsetY = self.tableView.contentOffset.y;
                // tableView的高度
                CGFloat height = self.tableView.frame.size.height;
                // 即将要展现的cell个数
                NSInteger sum = (group.models.count - 1)/2 +1;
                // 最后一个cell尾部的y值
                CGFloat y = cell.frame.origin.y + sum * 70;
                if (y > offsetY + height) {
                    // tableView要调整的偏移量
                    CGFloat delta = y - offsetY - height;
                    [self.tableView scrollRectToVisible:CGRectMake(0, offsetY + delta, self.tableView.frame.size.width, self.tableView.frame.size.height) animated:YES];
                }
                
            }
        }else{
            // 跳到下一个页面
            XMGLotteryChooseModel *model = cell.leftModel;
            // 创建控制器
            UIViewController *vc = [[UIViewController alloc]init];
            vc.view.backgroundColor = GlobeColor;
            vc.title = model.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end

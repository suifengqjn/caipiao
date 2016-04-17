//
//  XMGHallFocusCell.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGHallFocusCell.h"
#import "XMGHallFocusCollectionCell.h"

static NSInteger const EnLargeFactor = 10;
static CGFloat const TimerIntervals = 3.0;
static NSString *const XMGHallFocusCollectionCellID = @"XMGHallFocusCollectionCellID";
@implementation XMGHallFocusCell
{
    UICollectionView *_collectionView;
    UICollectionViewFlowLayout *_layout;
    UIPageControl *_page;
    
    NSTimer *_timer;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 0.创建一个UICollectionViewFlowLayout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        // 设置滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _layout = layout;
        
        // 1.添加UICollectionView
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        // 设置分页效果
        collectionView.pagingEnabled = YES;
        // 隐藏水平方向的滚动指示器
        collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:collectionView];
        _collectionView = collectionView;
        
        // 2.注册重用cell
        [collectionView registerClass:[XMGHallFocusCollectionCell class] forCellWithReuseIdentifier:XMGHallFocusCollectionCellID];
        
        // 3.创建页面指示器
        UIPageControl *page = [[UIPageControl alloc]init];
        // 3.1当前页颜色
        page.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        // 3.2正常状态的颜色
        page.pageIndicatorTintColor = [UIColor whiteColor];
        
        [self.contentView addSubview:page];

        _page = page;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.调整collectionView的frame
    _collectionView.frame = self.bounds;
    // 2.调整layout的size大小
    _layout.itemSize = self.bounds.size;
    
    // 3.调整页面指示器的位置
    _page.center = CGPointMake(self.center.x, self.center.y + 70);
    
    // 4.将collectionView滚动到最中间
    if (_collectionView.contentOffset.x == 0) {
        NSInteger middle = (self.imagesArray.count * EnLargeFactor)/2;
        NSIndexPath *index = [NSIndexPath indexPathForItem:middle inSection:0];
        [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
}
- (void)setImagesArray:(NSArray *)imagesArray
{
    _imagesArray = imagesArray;
    
    // 设置显示的总页面
    _page.numberOfPages = imagesArray.count;
    // 开启一个定时器
    [self startTimer];
}

#pragma mark - collectionViewDateSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesArray.count * EnLargeFactor;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMGHallFocusCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XMGHallFocusCollectionCellID forIndexPath:indexPath];
    
    NSInteger index = indexPath.item % self.imagesArray.count;
    cell.imageView.image = [UIImage imageNamed:self.imagesArray[index]];
    
    return cell;
}
#pragma mark -UIScrollView的Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取collectionView偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    // 获取当前scrollView的偏移值(以屏幕宽度为单位)
    NSInteger index = offsetX/scrollView.frame.size.width;
    
    // 显示当前页数
    _page.currentPage = index % self.imagesArray.count;
}
// 用户将要拖拽scrollView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //停止定时器滚动
    [_timer invalidate];
    _timer = nil;
}
// 用户停止拖拽scrollView
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
#pragma mark - 定时器的监听方法
- (void)startAutoScroll
{
    // 先获取上一张的图片,或则说图片对象的索引
    NSInteger currentIndex = _collectionView.contentOffset.x/_collectionView.frame.size.width;
    
    // 下一张图片
    currentIndex ++;
    
    // 让collectionView滚动到下一张
    if (currentIndex == self.imagesArray.count * EnLargeFactor) { //滚动到最后一张了,下次滚回第一张
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }else{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:currentIndex inSection:0];
        [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}
#pragma mark - 私有方法
- (void)startTimer
{
    [_timer invalidate];
    _timer = nil;
    // 1.创建一个定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:TimerIntervals target:self selector:@selector(startAutoScroll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    _timer = timer;
}
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    
    return RGB(r, g, b);
}
@end

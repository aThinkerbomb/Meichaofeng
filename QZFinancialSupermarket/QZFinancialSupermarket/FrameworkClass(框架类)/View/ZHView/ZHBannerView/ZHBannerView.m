//
//  ZHBannerView.m
//  轮播
//
//  Created by wzh on 16/12/12.
//  Copyright © 2016年 wzh. All rights reserved.
//
#import "ZHBannerView.h"
#import "ZHBannerCell.h"

// 总共的item数
#define ZH_TOTAL_ITEMS (self.itemCount * 20000)

#define ZH_FOOTER_WIDTH 64.0
#define ZH_PAGE_CONTROL_HEIGHT 32.0

@interface ZHBannerView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) ZHBannerFooter *footer;
@property (nonatomic, strong, readwrite) UIPageControl *pageControl;

@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ZHBannerView

@synthesize scrollInterval = _scrollInterval;
@synthesize autoScroll = _autoScroll;
@synthesize shouldLoop =_shouldLoop;
@synthesize pageControl = _pageControl;
@synthesize pageControlView = _pageControlView;

static NSString *banner_item = @"banner_item";
static NSString *banner_footer = @"banner_footer";

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateSubviewsFrame];
}

- (void)updateSubviewsFrame
{
    // collectionView
    self.flowLayout.itemSize = self.bounds.size;
    
    //wzh 添加  else 的判断
    if(self.flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal){
        self.flowLayout.footerReferenceSize = CGSizeMake(ZH_FOOTER_WIDTH, self.frame.size.height);
    }else{
        self.flowLayout.footerReferenceSize = CGSizeZero;
    }
    self.collectionView.frame = self.bounds;
    [self.collectionView reloadData];
    
    // pageControl
    if (CGRectEqualToRect(self.pageControlFrame, CGRectZero)) {
        // 若未对pageControl设置过frame, 则使用以下默认frame
        CGFloat w = self.frame.size.width;
        CGFloat h = ZH_PAGE_CONTROL_HEIGHT;
        CGFloat x = 0;
        CGFloat y = self.frame.size.height - h;
        self.pageControl.frame = CGRectMake(x, y, w, h);
    }
    
    //wzh  添加
    self.pageControlView.frame = CGRectMake(0, self.frame.size.height - PageView_H, self.frame.size.width, PageView_H);

}

// 配置默认起始位置
- (void)fixDefaultPosition
{
    if (self.itemCount == 0) {
        return;
    }
    
    if (self.shouldLoop) {
        // 总item数的中间
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:(ZH_TOTAL_ITEMS / 2) inSection:0]
                                        atScrollPosition:[self leftOrTopOrRightOrBottom] animated:NO];
            self.pageControl.currentPage = 0;
            self.pageControlView.currentPage = 0;

        });
    } else {
        // 第0个item
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]
                                        atScrollPosition:[self leftOrTopOrRightOrBottom] animated:NO];
            self.pageControl.currentPage = 0;
            self.pageControlView.currentPage = 0;

        });
    }
}

#pragma mark - Reload

- (void)reloadData
{
    if (!self.dataSource || self.itemCount == 0) {
        return;
    }
    
    // 设置pageControl总页数
    self.pageControl.numberOfPages = self.itemCount;
    self.pageControlView.pageCount = self.itemCount;

    //2017年3月2日添加
    if(self.pageControl.numberOfPages <= 1){
        self.pageControl.hidden = YES;
    }
    if(self.pageControlView.pageCount <= 1){
        self.pageControlView.hidden = YES;
    }
    
    // 刷新数据
    [self.collectionView reloadData];
    
    // 开启定时器
    [self startTimer];
}

#pragma mark - NSTimer

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)startTimer
{
    if (!self.autoScroll) return;
    
    [self stopTimer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollInterval target:self selector:@selector(autoScrollToNextItem) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

// 定时器方法
- (void)autoScrollToNextItem
{
    if (self.itemCount == 0 ||
        self.itemCount == 1 ||
        !self.autoScroll)
    {
        return;
    }
    
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] firstObject];
    NSUInteger currentItem = currentIndexPath.item;
    NSUInteger nextItem = currentItem + 1;
    
    if(nextItem >= ZH_TOTAL_ITEMS) {
        return;
    }
    
    if (self.shouldLoop)
    {
        // 无限往下翻页
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:0]
                                    atScrollPosition:[self leftOrTopOrRightOrBottom]
                                            animated:YES];
    } else {
        if ((currentItem % self.itemCount) == self.itemCount - 1) {
            // 当前最后一张, 回到第0张
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]
                                        atScrollPosition:[self leftOrTopOrRightOrBottom]
                                                animated:YES];
        } else {
            // 往下翻页
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:0]
                                        atScrollPosition:[self leftOrTopOrRightOrBottom]
                                                animated:YES];
        }
    }
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.shouldLoop) {
        return ZH_TOTAL_ITEMS;
    } else {
        return self.itemCount;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZHBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:banner_item forIndexPath:indexPath];
 
    if ([self.dataSource respondsToSelector:@selector(banner:viewForItemAtIndex:)]) {
        
        cell.itemView = [self.dataSource banner:self viewForItemAtIndex:indexPath.item % self.itemCount];
        
    }
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)theCollectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)theIndexPath
{
    UICollectionReusableView *footer = nil;
    
    if(kind == UICollectionElementKindSectionFooter)
    {
        footer = [theCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:banner_footer forIndexPath:theIndexPath];
        self.footer = (ZHBannerFooter *)footer;
        
        // 配置footer的提示语
        if ([self.dataSource respondsToSelector:@selector(banner:titleForFooterWithState:)]) {
            self.footer.idleTitle = [self.dataSource banner:self titleForFooterWithState:ZHBannerFooterStateIdle];
            self.footer.triggerTitle = [self.dataSource banner:self titleForFooterWithState:ZHBannerFooterStateTrigger];
        }
    }
    
    if (self.showFooter) {
        self.footer.hidden = NO;
    } else {
        self.footer.hidden = YES;
    }
    
    return footer;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(banner:didSelectItemAtIndex:)]) {
        [self.delegate banner:self didSelectItemAtIndex:(indexPath.item % self.itemCount)];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *currentIndexPath = [[collectionView indexPathsForVisibleItems] firstObject];
    self.pageControl.currentPage = currentIndexPath.item % self.itemCount;
    self.pageControlView.currentPage = currentIndexPath.item % self.itemCount;

}


#pragma mark - UIScrollViewDelegate
#pragma mark timer相关

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 用户滑动的时候停止定时器
    [self stopTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 用户停止滑动的时候开启定时器
    [self startTimer];
}

#pragma mark footer相关

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.showFooter) return;
    
    static CGFloat lastOffset;
    CGFloat footerDisplayOffset = (scrollView.contentOffset.x - ([self manualSetContentOffSet] * (self.itemCount - 1)));
    
    // footer的动画
    if (footerDisplayOffset > 0)
    {
        // 开始出现footer
        if (footerDisplayOffset > ZH_FOOTER_WIDTH) {
            if (lastOffset > 0) return;
            self.footer.state = ZHBannerFooterStateTrigger;
        } else {
            if (lastOffset < 0) return;
            self.footer.state = ZHBannerFooterStateIdle;
        }
        lastOffset = footerDisplayOffset - ZH_FOOTER_WIDTH;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!self.showFooter) return;

    CGFloat footerDisplayOffset = (scrollView.contentOffset.x - ([self manualSetContentOffSet] * (self.itemCount - 1)));
    
    // 通知footer代理
    if (footerDisplayOffset > ZH_FOOTER_WIDTH) {
        if ([self.delegate respondsToSelector:@selector(bannerFooterDidTrigger:)]) {
            [self.delegate bannerFooterDidTrigger:self];
        }
    }
}

#pragma mark - setters & getters
#pragma mark 属性

/**
 *  数据源
 */
- (void)setDataSource:(id<ZHBannerViewDataSource>)dataSource
{
    _dataSource = dataSource;
    
    // 刷新数据
    [self reloadData];
    
    // 配置默认起始位置
    [self fixDefaultPosition];
}

- (NSInteger)itemCount
{
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInBanner:)]) {
        return [self.dataSource numberOfItemsInBanner:self];
    }
    return 0;
}

/**
 *  是否需要循环滚动
 */
- (void)setShouldLoop:(BOOL)shouldLoop
{
    _shouldLoop = shouldLoop;
    
    [self reloadData];
    
    // 重置默认起始位置
    [self fixDefaultPosition];
}

- (BOOL)shouldLoop
{
    if (self.showFooter) {
        // 如果footer存在就不应该有循环滚动
        return NO;
    }
    if (self.itemCount == 1) {
        // 只有一个item也不应该有循环滚动
        return NO;
    }
    return _shouldLoop;
}

/**
 *  是否显示footer
 */
- (void)setShowFooter:(BOOL)showFooter
{
    _showFooter = showFooter;
    
    [self reloadData];
}

/**
 *  是否自动滑动
 */
- (void)setAutoScroll:(BOOL)autoScroll
{
    _autoScroll = autoScroll;
    
    if (autoScroll) {
        [self startTimer];
    } else {
        [self stopTimer];
    }
}

- (BOOL)autoScroll
{
    if (self.itemCount < 2) {
        // itemCount小于2时, 禁用自动滚动
        return NO;
    }
    return _autoScroll;
}

/**
 *  自动滑动间隔时间
 */
- (void)setScrollInterval:(CGFloat)scrollInterval
{
    _scrollInterval = scrollInterval;
    
    [self startTimer];
}

- (CGFloat)scrollInterval
{
    if (!_scrollInterval) {
        _scrollInterval = 3.0; // default
    }
    return _scrollInterval;
}

#pragma mark 控件

/**
 *  collectionView
 */
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.pagingEnabled = YES;
        _collectionView.alwaysBounceHorizontal = YES; // 小于等于一页时, 允许bounce
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollsToTop = NO;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        // 注册cell
        [_collectionView registerClass:[ZHBannerCell class] forCellWithReuseIdentifier:banner_item];
        
        // 注册 \ 配置footer
        [_collectionView registerClass:[ZHBannerFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:banner_footer];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, -ZH_FOOTER_WIDTH);
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.sectionInset = UIEdgeInsetsZero;
    }
    return _flowLayout;
}

/**
 *  pageControl
 */
- (void)setPageControl:(UIPageControl *)pageControl
{
    // 移除旧oageControl
    [_pageControl removeFromSuperview];
    
    // 赋值
    _pageControl = pageControl;
    
    // 添加新pageControl
    _pageControl.userInteractionEnabled = NO;
    _pageControl.autoresizingMask = UIViewAutoresizingNone;
    _pageControl.backgroundColor = [UIColor redColor];
    [self addSubview:_pageControl];
    
    [self reloadData];
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.autoresizingMask = UIViewAutoresizingNone;
    }
    return _pageControl;
}

- (void)setPageControlFrame:(CGRect)pageControlFrame
{
    _pageControlFrame = pageControlFrame;
    
    self.pageControl.frame = pageControlFrame;
}

/*
 *  wzh  后添加
 **/
- (void)setPageControlView:(ZHPageControlView *)pageControlView{
    // 移除旧oageControl
    [_pageControlView removeFromSuperview];
    //隐藏pageContro
    self.pageControl.hidden = YES;
    
    // 赋值
    _pageControlView = pageControlView;
    
    // 添加新pageControl
    _pageControlView.userInteractionEnabled = NO;
    _pageControlView.autoresizingMask = UIViewAutoresizingNone;
    //    _pageControlView.backgroundColor = [UIColor redColor];
    [self addSubview:_pageControlView];
    
    [self reloadData];
}

- (ZHPageControlView *)pageControlView{
    if(!_pageControlView){
        _pageControlView = [[ZHPageControlView alloc]init];
        [self addSubview:_pageControlView];
    }
    return _pageControlView;
}

- (void)setScrollDirection:(ZHBannerViewScrollDirection)scrollDirection{
    _scrollDirection = scrollDirection;
    [self setScrollDirectionConfiguration];
    [self reloadData];
}
- (void)setBannerViewType:(ZHBannerViewType)bannerViewType{
    _bannerViewType = bannerViewType;
    if(bannerViewType == ZHBannerViewTypeScrollToNoticeView){
        [self scrollViewTop];
    }
}
- (void)setIsManual:(BOOL)isManual{
    _isManual = isManual;
    self.collectionView.scrollEnabled = isManual;
}

//滚动方向的配置
- (void)setScrollDirectionConfiguration{
    if(self.scrollDirection == ZHBannerViewScrollDirectionVerticalLeft || self.scrollDirection == ZHBannerViewScrollDirectionVerticalRight){
        self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView.alwaysBounceHorizontal = YES;// 小于等于一页时, 允许bounce
        self.collectionView.alwaysBounceVertical = NO;// 小于等于一页时, 允许bounce
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, -ZH_FOOTER_WIDTH);
    }else{
        self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.collectionView.alwaysBounceHorizontal = NO;// 小于等于一页时, 允许bounce
        self.collectionView.alwaysBounceVertical = YES;// 小于等于一页时, 允许bounce
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

- (UICollectionViewScrollPosition)leftOrTopOrRightOrBottom{
    switch (self.scrollDirection) {
        case ZHBannerViewScrollDirectionVerticalLeft:
            return UICollectionViewScrollPositionLeft;
            break;
        case ZHBannerViewScrollDirectionVerticalTop:
            return UICollectionViewScrollPositionTop;
            
            break;
        case ZHBannerViewScrollDirectionVerticalRight:
            return UICollectionViewScrollPositionRight;
            
            break;
        case ZHBannerViewScrollDirectionVerticalBottom:
            return UICollectionViewScrollPositionBottom;
            
            break;
        default:
            return UICollectionViewScrollPositionLeft;
            break;
    }
}

- (CGFloat)manualSetContentOffSet{
    if(self.scrollDirection == ZHBannerViewScrollDirectionVerticalLeft || self.scrollDirection == ZHBannerViewScrollDirectionVerticalRight){
        return self.frame.size.width;
    }else{
        return self.frame.size.height;
    }
}

- (void)scrollViewTop{
    self.scrollDirection = ZHBannerViewScrollDirectionVerticalTop;
    self.collectionView.scrollEnabled = NO;
    self.autoScroll = YES;
    self.shouldLoop = YES;
    self.pageControlView.hidden = YES;
    self.pageControl.hidden =YES;
}
- (void)dropDownReloadData{
    _shouldLoop = YES;
    self.autoScroll = YES;

}

@end

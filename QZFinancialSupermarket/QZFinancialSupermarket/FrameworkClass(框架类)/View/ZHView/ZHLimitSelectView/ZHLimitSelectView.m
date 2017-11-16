//
//  ZHLimitSelectView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/19.
//
//

#import "ZHLimitSelectView.h"
#import "ZHLimitSelectCell.h"
#import "ZHLimitSelectFlowLayout.h"


#define Mid 0 * kScaleOfX
#define FlowLayoutW self.bounds.size.width / Item_Num - Mid * 2
#define Item_Num 5
//左右不加2俩个 设置0
#define LeftAndRightNum  (Item_Num - 1)/2

@interface ZHLimitSelectView () <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ZHLimitSelectFlowLayout *flowLayout;
@property (nonatomic, strong) UIView *bgStyleView;
@property (nonatomic, assign) BOOL isSelect;


@end
static NSString *banner_item = @"banner_item";

@implementation ZHLimitSelectView
@synthesize bgStytleBorderColor = _bgStytleBorderColor;

- (UIView *)bgStyleView{
    if(!_bgStyleView){
        _bgStyleView = [[UIView alloc]init];
        _bgStyleView.backgroundColor = [UIColor clearColor];
//        _bgStyleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"silderCircle"]];
        _bgStyleView.userInteractionEnabled = YES;
//        [self addSubview:_bgStyleView];
    }
    return _bgStyleView;
}
/**
 *  collectionView
 */
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.alwaysBounceHorizontal = YES; // 小于等于一页时, 允许bounce
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollsToTop = NO;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        // 注册cell
        [_collectionView registerClass:[ZHLimitSelectCell class] forCellWithReuseIdentifier:banner_item];
        
    }
    return _collectionView;
}

- (ZHLimitSelectFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[ZHLimitSelectFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.sectionInset = UIEdgeInsetsZero;
    }
    return _flowLayout;
}
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
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bgStyleView];
    [self addSubview:self.collectionView];
}

- (UIColor *)bgStytleBorderColor{
    if(!_bgStytleBorderColor){
        _bgStytleBorderColor = [UIColor colorWith0x29344a];
    }
    return _bgStytleBorderColor;
}
- (void)setBgStytleBorderColor:(UIColor *)bgStytleBorderColor{
    _bgStytleBorderColor = bgStytleBorderColor;
}
/**
 *  数据源
 */
- (void)setDataSource:(id<ZHLimitSelectViewDataSource>)dataSource
{
    _dataSource = dataSource;
    
    // 刷新数据
    [self reloadData];
    
    // 配置默认起始位置
    [self fixDefaultPosition];
}
// 配置默认起始位置
- (void)fixDefaultPosition
{
    if (self.itemCount == 0) {
        return;
    }
    // 第0个item
    dispatch_async(dispatch_get_main_queue(), ^{
        self.collectionView.contentOffset = CGPointMake(0, 0);

    });
}
- (void)setDefautValueWithIndex:(NSInteger)index{
    if(index >= 0){
        [self.collectionView setContentOffset:CGPointMake(index * FlowLayoutW, 0) animated:YES];
    }
}


#pragma mark - Reload

- (void)reloadData
{
    if (!self.dataSource || self.itemCount == 0) {
        return;
    }
    // 刷新数据
//    [self.collectionView reloadData];
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (NSInteger)itemCount
{
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInLimitSelectView:)]) {
        return [self.dataSource numberOfItemsInLimitSelectView:self] + LeftAndRightNum*2;
    }
    return 0;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(FlowLayoutW, collectionView.height);
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZHLimitSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:banner_item forIndexPath:indexPath];
    if(indexPath.item < LeftAndRightNum || indexPath.item > self.itemCount - 1  - LeftAndRightNum){
        cell.itemView = [[UIView alloc]init];
        cell.userInteractionEnabled = NO;
    }else{
        cell.userInteractionEnabled = YES;
        if ([self.dataSource respondsToSelector:@selector(limitSelectView:viewForItemAtIndex:)]) {
            cell.itemView = [self.dataSource limitSelectView:self viewForItemAtIndex:indexPath.item - LeftAndRightNum];
        }
    }
    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isSelect == NO) {
        self.isSelect = YES;
        //在延时方法中将isSelect更改为isSelect
        [self performSelector:@selector(repeatDelay:) withObject:indexPath afterDelay:0.3f];

    }
}

- (void)repeatDelay:(NSIndexPath *)indexPath{
    
    self.isSelect = NO;
    // 在下面实现点击cell需要实现的逻辑就可以了
    [self.collectionView setContentOffset:CGPointMake((indexPath.item - 2) * FlowLayoutW, 0) animated:YES];
    
//    if ([self.delegate respondsToSelector:@selector(limitSelectView:didSelectItemAtIndex:)]) {
//        [self.delegate limitSelectView:self didSelectItemAtIndex:indexPath.item - LeftAndRightNum];
//    }
    if([self.delegate respondsToSelector:@selector(changeValueWithlimitSelectView:index:)]){
        [self.delegate changeValueWithlimitSelectView:self index:indexPath.item - LeftAndRightNum];
    }
}


-(void)updateCollectionViewCellStatus:(ZHLimitSelectCell *)myCollectionCell selected:(BOOL)selected
{
    
}
#pragma mark - UIScrollViewDelegate
#pragma mark timer相关

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 用户滑动的时候停止定时器

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 用户停止滑动的时候开启定时器
    CGPoint collectPoint =  [self convertPoint:self.collectionView.center toView:self.collectionView];

    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:collectPoint];
//    NSLog(@"indexPath.item ==== %ld    \nNSStringFromCGPoint(self.collectionView.center)======%@",indexPath.item,NSStringFromCGPoint(self.collectionView.center));
    
    if(indexPath.item >=LeftAndRightNum && indexPath.item < self.itemCount - LeftAndRightNum){
        if([self.delegate respondsToSelector:@selector(changeValueWithlimitSelectView:index:)]){
            [self.delegate changeValueWithlimitSelectView:self index:indexPath.item - LeftAndRightNum];
        }
    }
}

#pragma mark footer相关

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateSubviewsFrame];
}

- (void)updateSubviewsFrame
{
    
    self.collectionView.frame = self.bounds;
    [self.collectionView reloadData];
    self.bgStyleView.size = CGSizeMake(self.height, self.height);
    self.bgStyleView.center = CGPointMake(self.width / 2, self.height / 2);
    [self.bgStyleView styleWithCornerRadius:self.bgStyleView.width / 2 borderColor:self.bgStytleBorderColor borderWidth:1];
}

@end

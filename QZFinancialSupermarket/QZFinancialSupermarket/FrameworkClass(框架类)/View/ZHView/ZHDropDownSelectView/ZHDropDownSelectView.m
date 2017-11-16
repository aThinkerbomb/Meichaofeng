//
//  QZMyInestmentSelectView.m
//  QIZiDaiDemo
//
//  Created by wzh on 17/3/23.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ZHDropDownSelectView.h"
#import "ZHSelectAndNorCollectionCell.h"
#define ZHScaleOfX [UIScreen mainScreen].bounds.size.width / 375.0 // 6宽度缩放比例
#define ZHScreen_W [UIScreen mainScreen].bounds.size.width

#define Defaut_Duration 0.5

#define Defaut_TopContentView_Heigth 72 *ZHScaleOfX
#define Defaut_ItemNum 5
#define Defaut_LeftAndRightMid 9 *ZHScaleOfX
#define Defaut_TopAndBottomMid 20 *ZHScaleOfX
#define Defaut_CollectCellView_Height Defaut_TopContentView_Heigth - Defaut_TopAndBottomMid*2
#define Defaut_Item_Width  (self.width - (Defaut_ItemNum + 1) * Defaut_LeftAndRightMid) / Defaut_ItemNum

@interface ZHDropDownSelectView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CAAnimationDelegate>
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIView *topContentView;
@end
static NSString *_cell_Item_Identifier = @"cell_cell_Item_Identifier";
@implementation ZHDropDownSelectView
@synthesize duration = _duration;
- (UIView *)topContentView{
    if(!_topContentView){
        _topContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, Defaut_TopContentView_Heigth)];
        _topContentView.backgroundColor = [UIColor whiteColor];
        _topContentView.userInteractionEnabled = YES;
        [self addSubview:_topContentView];
    }
    return _topContentView;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(!_flowLayout){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.minimumInteritemSpacing = Defaut_LeftAndRightMid / 2;
        _flowLayout.minimumLineSpacing = Defaut_TopAndBottomMid;
        
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(Defaut_LeftAndRightMid, 0, ZHScreen_W - Defaut_LeftAndRightMid * 2,Defaut_CollectCellView_Height) collectionViewLayout:self.flowLayout];
        _collectionView.alwaysBounceVertical = YES;// 小于等于一页时, 允许bounce
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollsToTop = NO;//点头部状态栏回到顶部 默认 YES
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        // 注册cell
        [_collectionView registerClass:[ZHSelectAndNorCollectionCell class] forCellWithReuseIdentifier:_cell_Item_Identifier];
        
    }
    
    return _collectionView;
}

- (NSInteger)itemCount
{
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInSeletView:)]) {
        return [self.dataSource numberOfItemsInSeletView:self];
    }
    return 0;
}


- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:_selectIndex inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];//设置选中第一行（默认有蓝色背景）
}
- (NSTimeInterval)duration{
    if(!_duration){
        _duration = Defaut_Duration; // default
    }
    return _duration;
}
- (void)setDuration:(NSTimeInterval)duration
{
    _duration = duration;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setDefautUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setDefautUI];
    }
    return self;
}
- (void)setDefautUI{
    [self.topContentView addSubview:self.collectionView];
    self.collectionView.centerY = self.topContentView.height / 2;
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];//设置选中第一行（默认有蓝色背景）

}
- (void)layoutSubviews{
    [super layoutSubviews];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemCount;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZHSelectAndNorCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cell_Item_Identifier forIndexPath:indexPath];
    if ([self.dataSource respondsToSelector:@selector(selectView:viewForItemAtIndex:)]) {
        cell.itemView = [self.dataSource selectView:self viewForItemAtIndex:indexPath.item];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.userInteractionEnabled = YES;
    cell.contentView.userInteractionEnabled = YES;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if([self.dataSource respondsToSelector:@selector(itemSizeWithSelectView:indexPath:)]){
        return [self.dataSource itemSizeWithSelectView:self indexPath:indexPath];
    }
//    return CGSizeMake(self.topContentView.width / self.itemCount , self.topContentView.height);
    return CGSizeMake(Defaut_Item_Width, Defaut_CollectCellView_Height);

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndex = indexPath.item;
//    NSLog(@"点击了cell------");
    if([self.delegate respondsToSelector:@selector(selectView:didSelectItemAtIndex:)]){
        [self.delegate selectView:self didSelectItemAtIndex:indexPath.item];
        __block ZHDropDownSelectView *weakSelf = self;
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2/*延迟执行时间*/ * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [weakSelf closeAnimtion];
        });
    }
}





- (void)startAnimation{
    self.hidden = NO;
    self.topContentView.hidden = NO;
    [self addAnimationDuration:self.duration Type:kCATransitionPush subType:kCATransitionFromBottom key:@"downAnimation"];
}
- (void)closeAnimtion{
    self.topContentView.hidden = YES;
    [self addAnimationDuration:self.duration Type:kCATransitionReveal subType:kCATransitionFromTop key:@"upAnimation"];
 
}
- (void)animationDidStart:(CAAnimation *)anim{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CATransition *transition = (CATransition *)anim;
    if(transition.type == kCATransitionPush){
        self.hidden = NO;
    }else{
        self.hidden = YES;
    }
    [self.topContentView.layer removeAllAnimations];
    self.topContentView.userInteractionEnabled = YES;
    self.collectionView.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if([self.delegate respondsToSelector:@selector(closeSelectView)]){
        [self.delegate closeSelectView];
        [self closeAnimtion];
    }
}

- (void)addAnimationDuration:(NSTimeInterval)duration Type:(NSString *)type subType:(NSString *)subType key:(NSString *)key{
    CATransition *transition = [CATransition animation];
    transition.duration = duration;//时间
    transition.type = type;//动画的效果
    transition.subtype = subType;//动画的目的地
    transition.delegate = self;
    [self.topContentView.layer addAnimation:transition forKey:key];

}




@end

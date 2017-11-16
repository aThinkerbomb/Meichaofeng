//
//  ZHLimitSelectFlowLayout.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/21.
//
//

#import "ZHLimitSelectFlowLayout.h"

@implementation ZHLimitSelectFlowLayout

#define ZHLimitScale  0.88

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSArray *attributeArray = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributeArray = [[NSArray alloc]initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    
    for (UICollectionViewLayoutAttributes *attribute in attributeArray) {
        //计算与中心点之间的距离
        CGFloat disWithCenter = fabs((attribute.center.x - self.collectionView.contentOffset.x) - self.collectionView.bounds.size.width * 0.5);
        //确定缩放比例
        CGFloat scale = 1 - disWithCenter / (self.collectionView.bounds.size.width * 0.5) * ZHLimitScale;
        
        attribute.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return attributeArray;
}
//布局的细节处理
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //获取当前偏移量
    CGPoint targetProposed = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    //获取当前范围内显示的cell
    NSArray *attributeArray = [super layoutAttributesForElementsInRect:CGRectMake(targetProposed.x, 0, self.collectionView.bounds.size.width, MAXFLOAT)];
    //寻找距离中心点最近的图片
    CGFloat minDis = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attributeArray) {
        CGFloat disWithCenter = (attr.center.x - targetProposed.x) - self.collectionView.bounds.size.width * 0.5;
        
        if(fabs(disWithCenter) < fabs(minDis)){
            minDis = disWithCenter;
        }
    }
    //停止滚动后可能没有图片在中间，所以我们要计算距离中间最近的图片，然后偏移过去
    targetProposed.x += minDis;
    if(targetProposed.x < 0){
        targetProposed.x = 0;
    }
    
    return targetProposed;
    
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end

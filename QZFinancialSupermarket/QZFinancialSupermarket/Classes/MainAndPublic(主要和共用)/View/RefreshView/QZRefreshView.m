//
//  QZRefreshView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/7/3.
//
//

#import "QZRefreshView.h"
#import "QZActivityIndicatorView.h"
@interface QZRefreshView ()
@property(nonatomic, strong)UIView *centerView;


@end

@implementation QZRefreshView


- (void)setImages{
    //创建一个可变数组
    NSMutableArray *imageArray = [NSMutableArray new];
    //共22张动画
    for(int i = 1; i <= 20; i++){
        //通过for 循环,把我所有的 图片存到数组里面
        NSString *imageName = [NSString stringWithFormat:@"%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        
        CGFloat imageH = image.size.height;
        
        if (imageH > self.mj_h) {
            CGFloat scale = self.mj_h / imageH;
           image = [UIImage scaleImage:image toScale:scale];
        }
        
        if(image){
            [imageArray addObject:image];
        }
    }
    // 隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    self.stateLabel.hidden = YES;
    [self setImages:imageArray duration:2 forState:MJRefreshStateRefreshing];
    [self setImages:imageArray duration:2 forState:MJRefreshStatePulling];
    [self setImages:imageArray duration:2 forState:MJRefreshStateWillRefresh];
    [self setImages:imageArray duration:2 forState:MJRefreshStateIdle];

}





@end

//
//  QZActivityIndicatorView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/7/3.
//
//

#import "QZActivityIndicatorView.h"

@implementation QZActivityIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview{
    UIImageView *activityImageView = [[UIImageView alloc] init];
    [self addSubview:activityImageView];
    //创建一个可变数组
    NSMutableArray *imageArray = [NSMutableArray new];
    //共22张动画
    for(int i = 0; i < 65; i++){
        //通过for 循环,把我所有的 图片存到数组里面
        NSString *imageName = [NSString stringWithFormat:@"QZd_%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        if(image){
            [imageArray addObject:image];
        }
    }
    // 设置图片的序列帧 图片数组
    activityImageView.animationImages = imageArray;
    //动画执行时间,多长时间执行完动画
    activityImageView.animationDuration=3.0;
    self.activityImageView = activityImageView;
    self.activityImageView.frame = CGRectMake(0, 0, 100, 100);
}


- (void)stopAnimating{
    [self.activityImageView stopAnimating];
}

- (void)startAnimating{
    [self.activityImageView startAnimating];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.activityImageView.frame = self.bounds;
}
@end

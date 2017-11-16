//
//  ZHLoadingView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/7/1.
//
//

#import "ZHLoadingView.h"
#import "UIApplication+ActivityViewController.h"
static ZHLoadingView *_loadingView;
@implementation ZHLoadingView

+ (ZHLoadingView *)shareLoginViewManager{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _loadingView = [[self alloc] init];
        [_loadingView setFrame:CGRectMake(0, kNavBarAndStatusBarHeight, kScreenWidth, kScreenHeight)];
        _loadingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    });
    return _loadingView;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UIImageView *bgImageView = [[UIImageView alloc] init];
        [self addSubview:bgImageView];
        //创建一个可变数组
        NSMutableArray *imageArray = [NSMutableArray new];
        //共22张动画
        for(int i = 0; i < 22; i++){
            //通过for 循环,把我所有的 图片存到数组里面
            NSString *imageName = [NSString stringWithFormat:@"QZLL_%d",i];
            UIImage *image = [UIImage imageNamed:imageName];
            if(image){
                [imageArray addObject:image];
            }
        }
        
        // 设置图片的序列帧 图片数组
        bgImageView.animationImages = imageArray;
        //动画执行时间,多长时间执行完动画
        bgImageView.animationDuration=3.0;
        self.bgImageView = bgImageView;

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.bgImageView.size = CGSizeMake(48 * kScaleOfX, 48 * kScaleOfX);
    self.bgImageView.centerX = _loadingView.width / 2;
    self.bgImageView.centerY = kScreenHeight / 2;
}
- (void)setupSubviewsFrame{
    if([QZRootVC isKindOfClass:[QZTabBarController class]]){
        NSInteger activityVcNavVcNum = [[[UIApplication sharedApplication] activityViewController].navigationController viewControllers].count;
        if(activityVcNavVcNum > 1){
            _loadingView.height = kScreenHeight - kNavBarAndStatusBarHeight;
        }else{
            _loadingView.height = kScreenHeight - kNavBarAndStatusBarHeight - kTabBarHeigth;
        }
    }else{
        _loadingView.height = kScreenHeight;
    }
    self.bgImageView.centerY = kScreenHeight / 2 - kNavBarAndStatusBarHeight;

}
- (void)startLoading{
    [self startLoadingWithView:[UIApplication sharedApplication].keyWindow];
}
- (void)endLoading{
    [self.bgImageView stopAnimating];
    [self removeFromSuperview];
}

- (void)startLoadingWithView:(UIView *)view{
    [self endLoading];
    [view addSubview:self];
//    [self setupSubviewsFrame];
    [self.bgImageView startAnimating];
}
- (void)startLoadingMaxTopView{
    NSLog(@"**********************************%@",[[UIApplication sharedApplication]activityViewController].class);
    UIView *topView = [[UIApplication sharedApplication]activityViewController].view;
    if(topView){
        [self startLoadingWithView:topView];
    }else{
        [self startLoading];
    }
}
@end

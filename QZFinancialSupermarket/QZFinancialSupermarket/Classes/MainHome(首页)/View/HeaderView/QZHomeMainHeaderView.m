//
//  QZHomeMainHeaderView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZHomeMainHeaderView.h"
#import "HomeBannerModel.h"
#import "CycleScrollView.h"
@interface QZHomeMainHeaderView ()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *cycBackView;
@property (nonatomic, strong)CycleScrollView * cycScrollView;
@end


@implementation QZHomeMainHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"QZHomeMainHeaderView" owner:self options:nil];
    [self addSubview:self.view];

}




- (void)layoutSubviews{
    [super layoutSubviews];
    self.view.frame = self.bounds;
    
}

- (void)setBannerArray:(NSArray *)bannerArray {
    
    if (bannerArray.count > 0) {
        
        //  移除一个滚动视图，否则每次刷新都会addSubview一个
        [self.cycScrollView removeFromSuperview];
        
        self.cycScrollView = [[CycleScrollView alloc] initWithFrame:self.cycBackView.bounds totleCount:bannerArray.count currentIndexShow:^(NSInteger currentIndex, UIImageView *imageView, UILabel *label) {
            HomeBannerModel *model = [bannerArray objectAtIndex:currentIndex];
            NSString * imageStr = [ImageUrl stringByAppendingPathComponent:model.smallimage];
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:PlaceholderMax];
        } sourceHandler:^(NSInteger indexClick) {
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(clickedBannerAction:)]) {
                [self.delegate clickedBannerAction:indexClick];
            }
        }];
        self.cycScrollView.isShowCycTitle = NO;
        self.cycScrollView.timeInterval = 3;
        [self.cycScrollView startScrollAnimation];
        [self.cycBackView addSubview:self.cycScrollView];
        
       
        
        
    }
}



@end

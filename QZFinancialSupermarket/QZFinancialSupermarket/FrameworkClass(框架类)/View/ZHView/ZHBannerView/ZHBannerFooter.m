//
//  ZHBannerFooter.m
//  轮播
//
//  Created by wzh on 16/12/12.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "ZHBannerFooter.h"
#define ZH_ARROW_SIDE 15.f

@interface ZHBannerFooter ()

@end

@implementation ZHBannerFooter

@synthesize idleTitle = _idleTitle;
@synthesize triggerTitle = _triggerTitle;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.arrowView];
        [self addSubview:self.label];
        
        self.arrowView.image = [UIImage imageNamed:@"ZHBannerView.bundle/banner_arrow.png"];
        self.state = ZHBannerFooterStateIdle;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat arrowX = self.bounds.size.width / 2 - ZH_ARROW_SIDE - 2;
    CGFloat arrowY = self.bounds.size.height / 2 - ZH_ARROW_SIDE / 2;
    CGFloat arrowW = ZH_ARROW_SIDE;
    CGFloat arrowH = ZH_ARROW_SIDE;
    self.arrowView.frame = CGRectMake(arrowX, arrowY, arrowW, arrowH);
    
    CGFloat labelX = self.bounds.size.width / 2 + 2;
    CGFloat labelY = 0;
    CGFloat labelW = ZH_ARROW_SIDE;
    CGFloat labelH = self.bounds.size.height;
    self.label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

#pragma mark - setters & getters 

- (void)setState:(ZHBannerFooterState)state
{
    _state = state;
    
    switch (state) {
        case ZHBannerFooterStateIdle:
        {
            self.label.text = self.idleTitle;
            [UIView animateWithDuration:0.3 animations:^{
                self.arrowView.transform = CGAffineTransformMakeRotation(0);
            }];

        }
            break;
        case ZHBannerFooterStateTrigger:
        {
            self.label.text = self.triggerTitle;
            [UIView animateWithDuration:0.3 animations:^{
                self.arrowView.transform = CGAffineTransformMakeRotation(M_PI);
            }];
        }
            break;

        default:
            break;
    }
}

- (UIImageView *)arrowView
{
    if (!_arrowView) {
        _arrowView = [[UIImageView alloc] init];
    }
    return _arrowView;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textColor = [UIColor darkGrayColor];
        _label.numberOfLines = 0;
    }
    return _label;
}

- (void)setIdleTitle:(NSString *)idleTitle
{
    _idleTitle = idleTitle;
    
    if (self.state == ZHBannerFooterStateIdle) {
        self.label.text = idleTitle;
    }
}

- (NSString *)idleTitle
{
    if (!_idleTitle) {
        _idleTitle = @"拖动查看详情"; // default
    }
    return _idleTitle;
}

- (void)setTriggerTitle:(NSString *)triggerTitle
{
    _triggerTitle = triggerTitle;
    
    if (self.state == ZHBannerFooterStateTrigger) {
        self.label.text = triggerTitle;
    }
}

- (NSString *)triggerTitle
{
    if (!_triggerTitle) {
        _triggerTitle = @"释放查看详情"; // default
    }
    return _triggerTitle;
}

@end

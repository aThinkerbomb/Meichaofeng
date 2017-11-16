//
//  ProgressView.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/31.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView ()

@property (nonatomic,strong) CALayer *progressLayer;
@property (nonatomic,assign) CGFloat currentViewWdith;
@property (nonatomic, strong) UIView *progressView;
@end



@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.progressLayer = [CALayer layer];
        self.progressLayer.frame = CGRectMake(0, 0, 0, frame.size.height);
        self.progressLayer.backgroundColor = [UIColor colorWith0x4180E9].CGColor;
        
        [self.layer addSublayer:self.progressLayer];
        self.currentViewWdith = frame.size.width;
        
    }
    
    return self;
}

- (void)setProgress:(CGFloat)progress {
    
    _progress = progress;
    if (_progress <= 0) {
        self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    } else if (_progress <= 1) {
        self.progressLayer.frame = CGRectMake(0, 0, _progress * _currentViewWdith, self.frame.size.height);
    } else {
        self.progressLayer.frame = CGRectMake(0, 0, _currentViewWdith, self.frame.size.height);
    }
    
}


@end

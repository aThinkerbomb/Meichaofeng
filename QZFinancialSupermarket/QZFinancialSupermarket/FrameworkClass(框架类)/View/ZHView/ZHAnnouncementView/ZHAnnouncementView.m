//
//  ZHAnnouncementView.m
//  QIZiDaiDemo
//
//  Created by wzh on 17/3/27.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ZHAnnouncementView.h"
#import "ZHAnnouncementBaseView.h"
// 总共的item数
#define ZH_TOTAL_ITEMS (self.itemCount * 20000)
@interface ZHAnnouncementView ()<CAAnimationDelegate>

@property (nonatomic, strong) ZHAnnouncementBaseView *baseView;
@property (nonatomic, strong) NSTimer *timer;



@end
@implementation ZHAnnouncementView
static int _currentIndex = 0;

- (ZHAnnouncementBaseView *)baseView{
    if(!_baseView){
        _baseView = [[ZHAnnouncementBaseView alloc]initWithFrame:self.bounds];
    }
    return _baseView;
}


- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self setUpdownViewData];
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
    [self addSubview:self.baseView];
}
- (void)setUpdownViewData{

    self.baseView.itemView = [self.dataArray firstObject];
    if(self.dataArray.count < 2){
        return;
    }
    [self startTimer];

}
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)startTimer{
    [self stopTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollInterval target:self selector:@selector(autoScrollToNextItem) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)autoScrollToNextItem{
    _currentIndex++;
    if (_currentIndex >= [self.dataArray count]){
        _currentIndex = 0;
    }
    self.baseView.itemView = [self.dataArray objectAtIndex:_currentIndex];
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1;
//    animation.timingFunction = kCAMediaTimingFunctionEaseOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
    [self.baseView.layer addAnimation:animation forKey:@"animationID"];
}

- (void)animationDidStart:(CAAnimation *)anim{
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.baseView.layer removeAllAnimations];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了公告");
    
    if([self.delegate respondsToSelector:@selector(didAnnouncementView:currentIndex:)]){
        [self.delegate didAnnouncementView:self currentIndex:_currentIndex];
    }
}

@end

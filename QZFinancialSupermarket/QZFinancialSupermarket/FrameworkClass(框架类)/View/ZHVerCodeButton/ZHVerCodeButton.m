//
//  ZHVerCodeButton.m
//  验证码测试
//
//  Created by wzh on 17/3/8.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHVerCodeButton.h"
#define Defaut_CountDownTime 59
#define Defaut_TimeInterval 1.0
#define Defaut_Title @"发送验证码"
#define Defaut_SendingTitle @""
@interface ZHVerCodeButton (){
    NSInteger _securityTime;//验证码剩余时间
    NSTimer *_timer;// 定时器v
}
/** 时间戳*/
@property (nonatomic,assign)NSTimeInterval late;

@end

@implementation ZHVerCodeButton
- (NSInteger)countDownTime{
    if(_countDownTime <= 0){
        _countDownTime = Defaut_CountDownTime;
    }
    return _countDownTime;
}
- (NSString *)defautTitle{
    if(!_defautTitle){
        _defautTitle = Defaut_Title;
    }
    return _defautTitle;
}
- (NSString *)sendIngTitle{
    if(!_sendIngTitle){
        _sendIngTitle = Defaut_SendingTitle;
    }
    return _sendIngTitle;
}
- (NSInteger)timeInterval{
    if(_timeInterval <= 0){
        _timeInterval = Defaut_TimeInterval;
    }
    return _timeInterval;
}


- (void)getVerificationCode{
    
    if([self checkInputIsNullOrCorrect]){
        if(_timer){
            [_timer invalidate];
            _timer = nil;
        }
        _securityTime = self.countDownTime;
        [self setTitle:[NSString stringWithFormat:@"%lds%@",_securityTime,self.sendIngTitle] forState:UIControlStateNormal];
        self.enabled=NO;
        [self setTimerStr];
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(securityTimerAction) userInfo:Nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        }
}

- (void)securityTimerAction{
    _securityTime = [self returnUploadTime:self.late];
    if(_securityTime <= 0){
        [self destroyTimer];
        return;
    }
    [self setTitle:[NSString stringWithFormat:@"%lds%@",_securityTime,Defaut_SendingTitle] forState:UIControlStateNormal];
    
}
//记录开始倒计时的时间
- (void)setTimerStr{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval late = [dat timeIntervalSince1970]*1;
    self.late = late;
}
- (void)destroyTimer{
    [_timer setFireDate:[NSDate distantFuture]];//关闭定时器
    [_timer invalidate];
    _timer = nil;
    self.enabled=YES;
    [self setTitle:self.defautTitle forState:UIControlStateNormal];
}

- (BOOL)checkInputIsNullOrCorrect{
    return YES;
}

//处理退到后台处理
- (NSInteger)returnUploadTime:(NSTimeInterval)late;{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    NSInteger lastime = 0;
    NSTimeInterval cha= now - late;
    
    if (cha/3600<1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha];
        timeString = [timeString substringToIndex:timeString.length-7];
        lastime= 60 - [timeString integerValue];
    }
    return lastime;
}


@end

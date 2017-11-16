//
//  CALayer+Animation.m
//  
//
//  Created by wzh on 16/5/16.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "CALayer+Animation.h"

@interface CALayer ()<CAAnimationDelegate>

@end

@implementation CALayer (Animation)
- (void)addTransform_ScaleWithDuration:(int)duration{
    [self remove];
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    self.anchorPoint = CGPointMake(.5,.5);
    animation.fromValue = @0.0f;
    animation.toValue = @1.0f;
    //动画时间
    animation.duration=duration;
    //是否反转变为原来的属性值
    // animation.autoreverses=YES;
    //把animation添加到图层的layer中，便可以播放动画了。forKey指定要应用此动画的属性
    [self addAnimation:animation forKey:@"scale"];    
}

#pragma mark --调动动画
- (void)addBeatingAnimationWithDuration:(int)duration{
    [self remove];

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self addAnimation:animation forKey:nil];

    
}

- (void)addBeatingAnimationWithDuration2:(int)duration{
    [self remove];
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = duration;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.00f, 0.00f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],      
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self addAnimation:popAnimation forKey:nil];

}

/*
 *  摇动
 */
- (void)addShakeAnimationWithDuration:(int)duration{
    [self remove];
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 16;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = duration;
    
    //重复
    kfa.repeatCount =1;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self addAnimation:kfa forKey:@"shake"];
}


- (void)addNavAnimationWithDuration:(int)duration type:(NSString *)type{
//    [self remove];
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:duration];
    
    [animation setType: kCATransitionMoveIn];
    animation.delegate = self;
    [animation setSubtype: type];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [self addAnimation:animation forKey:@"nav"];
}
- (void)addNavAnimationWithType:(NSString *)type{
    
    [self addNavAnimationWithDuration: 0.3 type:type];
}

- (void)animationDidStart:(CAAnimation *)anim{
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"%@",self.animationKeys);

//    [self removeAllAnimations];
//    [self removeAnimationForKey:@"nav"];
}

- (void)remove{
//    [self removeFromSuperlayer];
//    [self removeAllAnimations];
}

/*
 *  direction 0 顺时针  1 逆时针
 */
- (CABasicAnimation *)transformWithDirection:(int)direction{
    return [self transformWithDirection:direction interval:2];
}
- (CABasicAnimation *)transformWithDirection:(int)direction interval:(CGFloat)interval{
    [self removeAllAnimations];

    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    CGFloat startf;
    CGFloat endf;
    if(direction == 0){
        startf = 0.f;
        endf = M_PI *2;
    }else{
        startf = M_PI *2;
        endf = 0.f;
    }
    transformAnimation.fromValue = [NSNumber numberWithFloat:startf];
    transformAnimation.toValue =  [NSNumber numberWithFloat:endf];
    transformAnimation.duration  = interval;
    transformAnimation.autoreverses = NO;
    transformAnimation.fillMode =kCAFillModeForwards;
    //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    transformAnimation.repeatCount = 1;
    [self addAnimation:transformAnimation forKey:nil];
    return transformAnimation;

}



@end

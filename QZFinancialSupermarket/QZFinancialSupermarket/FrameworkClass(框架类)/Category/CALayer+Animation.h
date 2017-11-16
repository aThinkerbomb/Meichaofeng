//
//  CALayer+Animation.h
//  
//
//  Created by wzh on 16/5/16.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Animation)
- (void)addTransform_ScaleWithDuration:(int)duration;

#pragma mark --调动动画
- (void)addBeatingAnimationWithDuration:(int)duration;
- (void)addBeatingAnimationWithDuration2:(int)duration;

-(void)addShakeAnimationWithDuration:(int)duration;
//kCATransitionFromLeft kCATransitionFromRight
- (void)addNavAnimationWithDuration:(int)duration type:(NSString *)type;
- (void)addNavAnimationWithType:(NSString *)type;


- (CABasicAnimation *)transformWithDirection:(int)direction;
- (CABasicAnimation *)transformWithDirection:(int)direction interval:(CGFloat)interval;
@end

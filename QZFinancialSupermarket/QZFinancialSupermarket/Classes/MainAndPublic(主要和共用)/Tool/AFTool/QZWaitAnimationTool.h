//
//  QZWaitAnimationTool.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import <Foundation/Foundation.h>
@interface QZWaitAnimationTool : NSObject


+ (void)startAnimation;
+ (void)endAnimation;
+ (void)startAnimationWithView:(UIView *)view;
+ (void)startLoadingMaxTopView;

+ (void)cancelRequestAndErrorViewHidden;


@end

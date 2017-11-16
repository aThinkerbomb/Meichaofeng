//
//  QZWaitAnimationTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/2.
//
//

#import "QZWaitAnimationTool.h"
#import "ZHLoadingView.h"

@implementation QZWaitAnimationTool

+(void)startAnimation{
    [[ZHLoadingView shareLoginViewManager] startLoading];
}

+ (void)endAnimation{
    [[ZHLoadingView shareLoginViewManager] endLoading];
}


+(void)startAnimationWithView:(UIView *)view{
    [[ZHLoadingView shareLoginViewManager] startLoadingWithView:view];
}
+ (void)startLoadingMaxTopView{
    [[ZHLoadingView shareLoginViewManager] startLoadingMaxTopView];
}


+ (void)cancelRequestAndErrorViewHidden{
//    [QZAFNetwork cancelAllHTTPOperations];
    [self endAnimation];

}

@end

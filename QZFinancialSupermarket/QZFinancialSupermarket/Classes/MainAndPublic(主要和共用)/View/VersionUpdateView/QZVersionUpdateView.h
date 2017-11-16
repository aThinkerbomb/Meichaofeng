//
//  QZVersionUpdateView.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/2.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^updateHandle)(NSInteger idex);

@interface QZVersionUpdateView : UIView

/**
 更新版本  Yes-强更   NO-弱更 ，default is NO.
 */
@property (nonatomic, assign) BOOL isNeedUpdate;
/**
 版本更新信息数组
 */
@property (nonatomic, strong) NSArray * updateMsgs;
/**
 版本更新提示
 */
@property (nonatomic, strong) NSString * updateTip;

// 显示版本更新提示
- (void)show;
- (void)close;

// 更新的回调
- (void)gotoUpdateVersion:(updateHandle)handle;
@end

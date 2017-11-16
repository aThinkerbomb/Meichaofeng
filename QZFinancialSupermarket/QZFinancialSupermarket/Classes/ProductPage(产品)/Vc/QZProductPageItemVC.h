//
//  QZProductPageItemVC.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZTableBaseViewController.h"

@interface QZProductPageItemVC : QZTableBaseViewController

/**
 * 类型 4-全部 1-放款快 2-低利率 3-易通过
 */
@property (nonatomic, assign) NSInteger type;
/**
 *
 */
@property(nonatomic,assign)UINavigationController *nav;


@property (nonatomic, assign) CGFloat myOtherHeight;

@end

//
//  QZInforDetailPageVC.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZBaseWebViewController.h"

@interface QZInforDetailPageVC : QZBaseWebViewController

//类型 1：贷款 2：资讯 3：轮播（如果评论的是贷款那就传1）
@property (nonatomic, assign) NSInteger commentType;

//被评论的资讯/轮播/贷款 的id
@property (nonatomic, assign) NSInteger commentId;

@end

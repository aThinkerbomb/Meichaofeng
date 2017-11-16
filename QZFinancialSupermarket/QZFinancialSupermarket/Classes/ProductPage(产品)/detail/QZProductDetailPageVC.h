//
//  QZProductDetailPageVC.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/14.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZBaseWebViewController.h"

@interface QZProductDetailPageVC : QZBaseWebViewController

//被评论的资讯/轮播/贷款 的id
@property (nonatomic, assign) NSInteger commentId;

//分享用到的title
@property (nonatomic, copy) NSString * proTitle;
//分享用到的url
@property (nonatomic, copy) NSString * url;
//申请时用到的跳转页面
@property (nonatomic, copy) NSString * h5link;

@end

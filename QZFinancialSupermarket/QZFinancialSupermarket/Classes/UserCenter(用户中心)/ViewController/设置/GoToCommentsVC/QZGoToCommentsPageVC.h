//
//  QZGoToCommentsPageVC.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZBaseViewController.h"
typedef NS_ENUM(NSInteger, QZEnterType) {
    QZEnterTypeDefaut = 0,
    //去评论
    QZEnterTypeTypeComments,
    //意见反馈
    QZEnterTypeTypeFeedback
    
};
@interface QZGoToCommentsPageVC : QZBaseViewController

@property (nonatomic, assign) QZEnterType enterType;

//类型1：贷款2：资讯3：轮播（如果评论的是贷款那就传1）
@property (nonatomic, assign) NSInteger commentType;

//被评论的资讯/轮播/贷款 的id
@property (nonatomic, assign) NSInteger commentId;

@end

//
//  HomeRecommendModel.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/26.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseCellModel.h"

@interface HomeRecommendModel : ZHBaseCellModel

/**
 产品id
 */
@property (nonatomic, assign) NSInteger recommendId;

/**
 产品名字
 */
@property (nonatomic, copy) NSString * name;

/**
 贷款图片
 */
@property (nonatomic, copy) NSString * loanimage;

/**
 额度范围
 */
@property (nonatomic, copy) NSString * range;

/**
 日利率
 */
@property (nonatomic, copy) NSString * dayinterest;
/**
 期限天数
 */
@property (nonatomic, copy) NSString * termday;

/**
 月利率
 */
@property (nonatomic, copy) NSString * monthinterest;

/**
 期限月数
 */
@property (nonatomic, copy) NSString * termmonth;

/**
 外链url
 */
@property (nonatomic, copy) NSString * h5link;

/**
 下载地址
 */
@property (nonatomic, copy) NSString * download;

/**
 是否需要登陆1登陆2不需要
 */
@property (nonatomic, copy) NSString * logunstatus;

/**
 放款人数
 */
@property (nonatomic, copy) NSString * applynumber;

/**
 特点产品
 */
@property (nonatomic, copy) NSString * featurestext;

/**
 地址包名
 */
@property (nonatomic, copy) NSString * packagename;

/**
 连接包含
 */
@property (nonatomic, copy) NSString * linkcontain;
@end

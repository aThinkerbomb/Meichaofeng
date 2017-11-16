//
//  HomeNewProductModel.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/10/31.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseCellModel.h"

@interface HomeNewProductModel : ZHBaseCellModel
/**
 新产品id
 */
@property (nonatomic, copy) NSString * productId;

/**
 贷款名称
 */
@property (nonatomic, copy) NSString * name;

/**
 热门贷款图片
 */
@property (nonatomic, copy) NSString * loanimage;

/**
 贷款来额度范围
 */
@property (nonatomic, copy) NSString * range;

/**
 是否需要登陆1登陆2不需要
 */
@property (nonatomic, copy) NSString * logunstatus;

/**
 贷款日利率
 */
@property (nonatomic, copy) NSString * dayinterest;

/**
 期限（天）
 */
@property (nonatomic, copy) NSString * termday;

/**
 贷款月利率
 */
@property (nonatomic, copy) NSString * monthinterest;

/**
 期限（月）
 */
@property (nonatomic, copy) NSString * termmonth;
/**
 放款人数
 */
@property (nonatomic, copy) NSString * applynumber;

/**
 第三方h5连接
 */
@property (nonatomic, copy) NSString * h5link;
/**
 产品特点
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

/**
 下载地址
 */
@property (nonatomic, copy) NSString * download;


@end

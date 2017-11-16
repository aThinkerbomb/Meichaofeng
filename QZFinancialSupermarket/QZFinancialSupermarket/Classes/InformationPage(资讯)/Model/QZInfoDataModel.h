//
//  QZInfoDataModel.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/27.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseCellModel.h"

@interface QZInfoDataModel : ZHBaseCellModel

@property (nonatomic, copy) NSString *InfoId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *smallimage;
@property (nonatomic, copy) NSString *read1;

/**
 1-小图cell   2-大图cell
 */
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *createtime;

@end

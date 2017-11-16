//
//  QZMyCommentsListCellItem.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ZHBaseCellModel.h"

@interface QZMyCommentsListCellItem : ZHBaseCellModel

@property (nonatomic, copy) NSString * commentId;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * read1;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, copy) NSString * common_type;
@property (nonatomic, copy) NSString * time_max;
@property (nonatomic, copy) NSString * content_num;




@property (nonatomic, copy) NSString * des;
@property (nonatomic, copy) NSString *num;


+ (instancetype)itemWithTitle:(NSString *)title des:(NSString *)des;

//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *title;

@end

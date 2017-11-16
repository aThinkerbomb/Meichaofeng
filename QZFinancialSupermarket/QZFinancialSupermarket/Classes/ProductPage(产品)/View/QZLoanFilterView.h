//
//  QZLoanFilterView.h
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/1.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FilterSelectedHandle)(NSInteger index);

@interface QZLoanFilterView : UIView

- (void)didSelectedHandle:(FilterSelectedHandle)handle;

@end

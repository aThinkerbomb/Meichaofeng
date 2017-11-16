//
//  QZHomeMainSectionHeaderView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RightButtonClick)(NSInteger index);

@interface QZHomeMainSectionHeaderView : UIView

@property (nonatomic, assign) NSInteger section;

- (void)sectionHeaderViewLeftTitle:(NSString *)title;
- (void)sectionHeaderViewRightTitle:(NSString *)title;

- (void)sectionHeaderViewLeftImage:(UIImage *)image;

- (void)sectionHeaderRightAction:(RightButtonClick)handle;

@end

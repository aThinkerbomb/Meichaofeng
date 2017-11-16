//
//  QZMyCommentSectionView.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/28.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZMyCommentSectionView.h"
#import "QZMyCommentsListCellItem.h"

@interface QZMyCommentSectionView ()
@property (weak, nonatomic) IBOutlet UIView *pointView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pointLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pointTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineRight;



@end


@implementation QZMyCommentSectionView

- (void)setCommentModel:(QZMyCommentsListCellItem *)commentModel {
    
    _commentModel = commentModel;
    if (![ZHTool isEmptyOrNullWithObject:_commentModel]) {
        
        self.title.text = _commentModel.title;
        
    }
 
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self  setUI];
    
    
}

- (void)setUI {
    
    self.pointLeft.constant = 15 * kScaleOfX;
    self.pointTop.constant = 25 * kScaleOfX;
    
    self.titleTop.constant = 20 * kScaleOfX;
    self.titleLeft.constant = 15 * kScaleOfX;
    self.titleRight.constant = 45 * kScaleOfX;
    
    self.lineLeft.constant = 15 * kScaleOfX;
    self.lineRight.constant = 15 * kScaleOfX;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.pointView styleWithCornerRadius:self.pointView.width / 2];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

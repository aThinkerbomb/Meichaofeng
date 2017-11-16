//
//  QZLoanFilterView.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/1.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZLoanFilterView.h"

@interface QZLoanFilterView ()
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;//tag 4
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;//tag 1
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;//tag 2
@property (weak, nonatomic) IBOutlet UIButton *forthBtn;//tag 3
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstBtnLeft;// 5
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstBtnRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstBtnHeight;



@property (nonatomic, strong) NSMutableArray * btnArray;
@property (nonatomic, copy)   FilterSelectedHandle handle;

@end

@implementation QZLoanFilterView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setDefault];
}

- (void)setDefault {
    
    // 约束适配
    self.firstBtnLeft.constant = 5 * kScaleOfX;
    self.firstBtnRight.constant = 5 * kScaleOfX;
    self.firstBtnHeight.constant = 30 * kScaleOfX;
    
    // 设置按钮样式
    [self.firstBtn styleWithCornerRadius:4.0 borderColor:[UIColor colorWith0x4180E9] borderWidth:1.0];
    [self.secondBtn styleWithCornerRadius:4.0 borderColor:[UIColor colorWith0x999999] borderWidth:1.0];
    [self.thirdBtn styleWithCornerRadius:4.0 borderColor:[UIColor colorWith0x999999] borderWidth:1.0];
    [self.forthBtn styleWithCornerRadius:4.0 borderColor:[UIColor colorWith0x999999] borderWidth:1.0];
    
    // 默认第一个按钮
    self.firstBtn.selected = YES;
    self.firstBtn.backgroundColor = [UIColor colorWith0x4180E9];
    
    // 把按钮都加入一个数组中
    self.btnArray = [NSMutableArray arrayWithObjects:_firstBtn, _secondBtn, _thirdBtn, _forthBtn, nil];
    
}



- (IBAction)BtnClickedAction:(UIButton *)sender {
    
    NSInteger btnTag = sender.tag;
    
    // 遍历 所有按钮
    for (UIButton *button in self.btnArray) {
        
        if (button.tag == btnTag) {
            
            // 设置选择的按钮样式
            sender.selected = YES;
            sender.backgroundColor = [UIColor colorWith0x4180E9];
            sender.layer.borderColor = [UIColor colorWith0x4180E9].CGColor;
            
            // 回调
            if (self.handle) {
                self.handle(btnTag);
            }
            
        } else {
            
            // 恢复其他按钮的样式
            button.selected = NO;
            button.backgroundColor = [UIColor whiteColor];
            button.layer.borderColor = [UIColor colorWith0x999999].CGColor;
        }
        
    }
    
}

- (void)didSelectedHandle:(FilterSelectedHandle)handle {
    if (handle) {
        self.handle = handle;
    }
}


- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

@end

//
//  QZVersionUpdateView.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/2.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZVersionUpdateView.h"

@interface QZVersionUpdateView()

// 更新标题
@property (weak, nonatomic) IBOutlet UILabel *updateTitle;

@property (weak, nonatomic) IBOutlet UIView *FirstBackView;
@property (weak, nonatomic) IBOutlet UIView *secondBackView;


//更新的内容
@property (weak, nonatomic) IBOutlet UILabel *message1;
@property (weak, nonatomic) IBOutlet UILabel *message2;
@property (weak, nonatomic) IBOutlet UILabel *message3;
@property (weak, nonatomic) IBOutlet UILabel *message4;
@property (weak, nonatomic) IBOutlet UILabel *message5;
@property (weak, nonatomic) IBOutlet UILabel *message6;

// 按钮
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

// 约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backViewWidth;//269
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backViewheight;//390

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ImageHeight;//136

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *msg1Top;//20
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *msg1Left;//20
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *msg1right;//20

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *updateBtnWidth;//100
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *updateBtnHeight;//38
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *updateBtnright;//20
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *updateBtnBottom;//10

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelBtnWidth;//100
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelBtnLeft;//20

@property (nonatomic, copy) updateHandle handle;

@end

@implementation QZVersionUpdateView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setConfigView];
}

- (void)setConfigView {
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    [self.FirstBackView styleWithCornerRadius:4.0];
    [self.secondBackView styleWithCornerRadius:4.0];
    
    self.backViewWidth.constant = 269 * kScaleOfX;
    self.backViewheight.constant = 390 * kScaleOfX;
    
    self.ImageHeight.constant = 136 * kScaleOfX;
    
    self.msg1Top.constant = 20 * kScaleOfX;
    self.msg1Left.constant = 20 * kScaleOfX;
    self.msg1right.constant = 20 * kScaleOfX;
    
    self.updateBtnWidth.constant = 100 * kScaleOfX;
    self.updateBtnHeight.constant = 38 * kScaleOfX;
    self.updateBtnright.constant = 20 * kScaleOfX;
    self.updateBtnBottom.constant = 10 * kScaleOfX;
    
    self.cancelBtnWidth.constant = 100 * kScaleOfX;
    self.cancelBtnLeft.constant = 20 * kScaleOfX;
    
    [self.updateBtn styleWithCornerRadius:4.0 borderColor:[UIColor colorWithHexString:@"ff665a"] borderWidth:1.0];
    
    [self.cancelBtn styleWithCornerRadius:4.0 borderColor:[UIColor colorWithHexString:@"6d6d6d"] borderWidth:1.0];
    
}


- (void)setUpdateMsgs:(NSArray *)updateMsgs {
    _updateMsgs = updateMsgs;
    
    NSInteger count = (_updateMsgs.count > 6 ? 6 : _updateMsgs.count);
    NSArray * msgLabels = @[_message1, _message2, _message3, _message4, _message5, _message6];
    if (count > 0) {
        
        CGFloat height = 0.0;
        
        for (int i = 0; i < count; i++) {
            
            UILabel *label = (UILabel *)msgLabels[i];
            NSString *msg = _updateMsgs[i];
            
            label.text = msg;
            
            CGFloat msgHeight = [ZHTool sizeWithString_H:msg font:[UIFont textFont15] width:(269 * kScaleOfX)-40];
            height += msgHeight;
        }
        self.backViewheight.constant = height + 270;
    }
}


- (void)show {
    [QZAPPDelegate.window addSubview:self];
}

- (void)close {
    [self removeFromSuperview];
}

- (IBAction)clickedAction:(UIButton *)sender {
    
    if (self.handle) {
        self.handle(sender.tag);
    }
    [self close];
}

- (void)gotoUpdateVersion:(updateHandle)handle {
    if (handle) {
        self.handle = handle;
    }
}


// setter
- (void)setUpdateTip:(NSString *)updateTip {
    _updateTip = updateTip;
    self.updateTitle.text = _updateTip;
}

- (void)setIsNeedUpdate:(BOOL)isNeedUpdate {
    _isNeedUpdate = isNeedUpdate;
    if (_isNeedUpdate == YES) {
        // 强制更新
        self.cancelBtn.hidden = YES;
        self.cancelBtnWidth.constant = 0;
        self.updateBtnWidth.constant = 269 * kScaleOfX - 2 * 20 * kScaleOfX;
    }
}

@end

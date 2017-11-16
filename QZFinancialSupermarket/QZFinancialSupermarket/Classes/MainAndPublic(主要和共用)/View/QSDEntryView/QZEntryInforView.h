//
//  QZEntryView.h
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/8.
//
//

#import <UIKit/UIKit.h>
#import "ZHPickerModel.h"
@class QZEntryInforView;

@protocol QZEntryInforViewDelegate <NSObject>

@optional
- (void)nextBtnActionWithView:(QZEntryInforView *)entryInforView;
@end

typedef NS_ENUM(NSInteger, QZEntryViewType) {
    
    //默认普通输入框录入信息
    QZEntryViewTypeDefaut = 0,
    //普通输入框录入信息
    QZEntryViewTypeInputSimple,
    //选择地址输入框
    QZEntryViewTypeSelectAdress,
    //选择银行输入框
    QZEntryViewTypeSelectBank,
    //跳到下一界面选择
    QZEntryViewTypeNextSelect,
    //其他
    QZEntryViewTypeInputOther
};

typedef NS_ENUM(NSInteger, QZEnterInforLineType) {
    /**
     *  上下线都显示 都是长的
     */
    QZEnterInforLineTypeDefaut = 0,
    /**
     *  上下都显示 上短下长
     */
    QZEnterInforLineTypeTopShortShowBottomShow,
    /**
     * 上显示 下隐藏  上长
     */
    QZEnterInforLineTypeTopShowBottomHidden,
    /**
     *  上显示 下隐藏  上段
     */
    QZEnterInforLineTypeTopShortShowBottomHidden,
    //上隐藏 下显示 下长
    QZEnterInforLineTypeTopHiddenBottomShow,
};
@interface QZEntryInforView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, assign) QZEntryViewType inputType;

@property (nonatomic, strong) NSArray *listArray;

@property (weak, nonatomic) IBOutlet UIView *topLineView;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *arrowBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowBtnW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTextLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconImageViewW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconAndLabMid;
@property (weak, nonatomic) IBOutlet UIButton *desBtn;
@property (weak, nonatomic) IBOutlet UIImageView *desImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineLeft;

@property (nonatomic, assign) QZEnterInforLineType lineType;

@property (nonatomic, weak) __weak id<QZEntryInforViewDelegate> delegate;


- (void)setItemIconImageName:(NSString *)imageName title:(NSString *)title placeholder:(NSString *)placeholder inputType:(QZEntryViewType)inputType;

- (void)setItemInputText:(NSString *)inputText itemEnabled:(BOOL)enabled;

- (void)setItemInputText:(NSString *)inputText;

- (void)setItemEnabled:(BOOL)enabled;

- (NSString *)getInputText;

- (void)setPickerViewDefautModel:(ZHPickerModel *)defautModel;
- (ZHPickerModel *)getPickerSelectModel;
@end

//
//  QZEntryView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/8.
//
//

#import "QZEntryInforView.h"
#import "ZHCitySelectView.h"
#import "ZHPickerView.h"

@interface QZEntryInforView ()<UITextFieldDelegate>

@property (nonatomic, strong) ZHPickerView *pickerView;

@end

@implementation QZEntryInforView
@synthesize listArray = _listArray;

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"QZEntryInforView" owner:self options:nil];
    [self addSubview:self.view];
    [self setDefautUI];
}
- (void)setDefautUI{
    
    self.iconImageViewW.constant = 20 * kScaleOfX;
    self.iconAndLabMid.constant = 12 * kScaleOfX;
    self.topLineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    self.bottomLineView.backgroundColor = [UIColor colorWith0xd7d7d7];
    [self.arrowBtn setImage:[UIImage imageNamed:@"右箭头-"] forState:UIControlStateNormal];
    [self.arrowBtn setImage:[UIImage imageNamed:@"右箭头-"] forState:UIControlStateHighlighted];

    self.arrowBtn.hidden = NO;
    self.nextBtn.hidden = YES;
    self.iconImageView.contentMode = UIViewContentModeCenter;
    
    [self.titleLab textColor:[UIColor colorWith0x29344a] textFont:[UIFont textFont16]];
    self.inputTextField.textColor = [UIColor colorWith0x29344a];
    self.inputTextField.font = [UIFont textCustomFont16];
//    self.inputTextField.textColor = [UIColor colorWith0x999999];
    [self.inputTextField setValue:[UIColor colorWith0xb4b4b4] forKeyPath:QZPlacehoderTitleColor];
    [self.inputTextField setValue:[UIFont textCustomFont16] forKeyPath:QZPlacehoderTitleFont];
    self.inputTextField.enabled = NO;
    self.inputTextField.inputView = nil;
    self.desBtn.hidden = YES;
    [self.desBtn title:@"" titleColor:[UIColor colorWith0x29344a]titleFont:[UIFont textCustomFont16]];
    self.desImage.hidden = YES;
}
- (void)setItemIconImageName:(NSString *)imageName title:(NSString *)title placeholder:(NSString *)placeholder inputType:(QZEntryViewType)inputType{
    if([ZHTool isNONUllOrIsEmptyWith:imageName]){
        self.iconImageView.image = [UIImage imageNamed:imageName];
    }
    self.titleLab.text = [ZHTool strongConversionWith:title];
    self.inputTextField.placeholder = [ZHTool strongConversionWith:placeholder];
    self.inputType = inputType;
}
- (void)setItemInputText:(NSString *)inputText itemEnabled:(BOOL)enabled{
    [self setItemInputText:inputText];
    [self setItemEnabled:enabled];
}

- (void)setItemInputText:(NSString *)inputText{
    self.inputTextField.text = [ZHTool strongConversionWith:inputText];
}
- (void)setItemEnabled:(BOOL)enabled{
    self.userInteractionEnabled = enabled;
}
- (NSArray *)listArray{
    if(!_listArray){
        _listArray = [NSArray array];
    }
    return _listArray;
}
- (void)setListArray:(NSArray *)listArray{
    _listArray = listArray;
    [self setInputTextFieldInputViewWithEntryViewTypeSelectBank];
}

- (void)setInputType:(QZEntryViewType)inputType{
    _inputType = inputType;
    [self setDefautUI];
    
    switch (self.inputType) {
        case QZEntryViewTypeDefaut:
        case QZEntryViewTypeInputSimple:{
            self.arrowBtn.hidden = YES;
            self.inputTextField.enabled = YES;
        }
            break;
        case QZEntryViewTypeSelectAdress:{
            self.inputTextField.enabled = YES;
            
            ZHCitySelectView *citySelectView = [[ZHCitySelectView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, 256)];
            __block QZEntryInforView *weakSelf = self;
            citySelectView.doneBlock = ^(ZHSelectCityModel *selectModel){
                weakSelf.inputTextField.text = [NSString stringWithFormat:@"%@-%@-%@",selectModel.province,selectModel.city,selectModel.area];
                [weakSelf endEditing:YES];//使键盘消失
            };
            //目前没用到
            citySelectView.confirmBlock = ^(ZHSelectCityModel *selectModel){

            };
            citySelectView.cancelBlock = ^(){
                [weakSelf endEditing:YES];//使键盘消失
            };
            self.inputTextField.inputView = citySelectView;
        }
            break;
        case QZEntryViewTypeSelectBank:{
            self.inputTextField.enabled = YES;
            [self setInputTextFieldInputViewWithEntryViewTypeSelectBank];
        }
            break;
            
        case QZEntryViewTypeNextSelect:{
            self.nextBtn.hidden = NO;

        }
            break;
            
        default:
            break;
    }
}
- (void)setInputTextFieldInputViewWithEntryViewTypeSelectBank{
    __block QZEntryInforView *weakSelf = self;
    ZHPickerView *selectBankCardPickerView = [[ZHPickerView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, 256) listArray:self.listArray];
    selectBankCardPickerView.confirmBlock = ^(ZHPickerModel *selectModel){
    };
    //点击确定按钮回调
    selectBankCardPickerView.doneBlock = ^(ZHPickerModel *selectModel){
        weakSelf.inputTextField.text = [ZHTool strongConversionWith:selectModel.title];
        //使键盘消失
        [self.view endEditing:YES];
    };
    //点击取消按钮回调
    selectBankCardPickerView.cancelBlock = ^(){
        [self.view endEditing:YES];
    };
    self.inputTextField.inputView = selectBankCardPickerView;
    self.pickerView = selectBankCardPickerView;
}
- (NSString *)getInputText{
    if([ZHTool isNUllOrIsEmptyWith:self.inputTextField.text]){
        return  @"";
    }
    return [NSString stringWithFormat:@"%@",self.inputTextField.text];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.view.frame = self.bounds;
    
    self.inputTextLeft.constant = 7 * kScaleOfX;
    //如果隐藏
    if(self.arrowBtn.hidden){
        self.arrowBtnW.constant = 0;
        self.inputTextLeft.constant = 0;
    }
}
- (IBAction)nextBtnAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(nextBtnActionWithView:)]){
        [self.delegate nextBtnActionWithView:self];
    }
}
- (void)setPickerViewDefautModel:(ZHPickerModel *)defautModel{
    if(self.pickerView){
        self.pickerView.defautModel = defautModel;
    }
}

- (ZHPickerModel *)getPickerSelectModel{
    if(!self.pickerView || !self.pickerView.selectModel){
        return [[ZHPickerModel alloc]init];
    }
    return self.pickerView.selectModel;
}

#pragma mark -- 只有个人信息页面用到
- (void)setLineType:(QZEnterInforLineType)lineType{
    _lineType = lineType;
    switch (_lineType) {
        case QZEnterInforLineTypeDefaut:{
            self.topLineView.hidden = NO;
            self.topLineRight.constant = 0;
            self.topLineLeft.constant = 0;
            self.bottomLineView.hidden = NO;
        }
            break;
        case QZEnterInforLineTypeTopShowBottomHidden:{
            self.topLineView.hidden = NO;
            self.topLineRight.constant = 0;
            self.topLineLeft.constant = 0;
            self.bottomLineView.hidden = YES;
        }
            break;
        case QZEnterInforLineTypeTopShortShowBottomShow:{
            self.topLineView.hidden = NO;
            self.topLineRight.constant = 15 * kScaleOfX;
            self.topLineLeft.constant = 15 * kScaleOfX;
            self.bottomLineView.hidden = NO;
        }
            break;
        case QZEnterInforLineTypeTopShortShowBottomHidden:{
            self.topLineView.hidden = NO;
            self.topLineRight.constant = 15 * kScaleOfX;
            self.topLineLeft.constant = 15 * kScaleOfX;
            self.bottomLineView.hidden = YES;
        }
            break;
        default:
            break;
    }
}
@end

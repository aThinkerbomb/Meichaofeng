//
//  ZHPickerView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/14.
//
//

#import "ZHPickerView.h"

@interface ZHPickerView ()

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIView *toolsView;

@end

@implementation ZHPickerView
- (ZHPickerModel *)selectModel{
    if(!_selectModel){
        _selectModel = [[ZHPickerModel alloc]init];
    }
    return _selectModel;
}
- (UIPickerView *)pickerView{
    if(!_pickerView){
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40,self.frame.size.width,self.frame.size.height-40)];
        _pickerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _pickerView.layer.borderWidth = 0.0;
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

- (UIView *)toolsView{
    if(!_toolsView){
        _toolsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        _toolsView.layer.borderWidth = 0.5;
        _toolsView.layer.borderColor = [UIColor grayColor].CGColor;
        [self addSubview:_toolsView];
    }
    return _toolsView;
}

- (void)setDefautModel:(ZHPickerModel *)defautModel{
    _defautModel = defautModel;
    for (ZHPickerModel *model in self.listArray) {
        if([model.selectId isEqual:_defautModel.selectId] &&
           [model.title isEqual:_defautModel.title]){
            self.selectModel = _defautModel;
        }
    }
}
- (instancetype)initWithFrame:(CGRect)frame listArray:(NSArray *)listArray{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.listArray = listArray;
        if(self.listArray.count > 0 && self.listArray){
            self.selectModel = [self.listArray firstObject];
        }
        // 默认初始个空
        [self addSubview:self.pickerView];
    
        UIButton *determineBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-77, 0, 77, 40)];
        [determineBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [determineBtn setTitle:@"确定" forState:UIControlStateNormal];
        [determineBtn addTarget:self action:@selector(determineBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self.toolsView addSubview:determineBtn];
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 77, 40)];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self.toolsView addSubview:cancelBtn];
        
    }
    return self;

}
- (void)setToolsHidden:(BOOL)toolsHidden{
    _toolsHidden = toolsHidden;
    _toolsView.hidden = toolsHidden;
}
#pragma mark pickView-delegate

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1; // 返回1表明该控件只包含1列
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法返回teams.count，表明teams包含多少个元素，该控件就包含多少行
    return self.listArray.count;
}


// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
// 中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法根据row参数返回teams中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用teams中的第几个元素
    ZHPickerModel *pickerModel = [self.listArray objectAtIndex:row];
    return pickerModel.title;
}

// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    if(self.listArray.count > 0 && self.listArray && self.listArray.count > row){
        self.selectModel = [self.listArray objectAtIndex:row];
    }
    if(self.confirmBlock){
        self.confirmBlock(self.selectModel);
    }
}



#pragma mark --  确定
- (void)determineBtnAction{
    if(self.doneBlock){
        self.doneBlock(self.selectModel);
    }
}
#pragma mark --  取消
- (void)cancelBtnAction{
    if(self.cancelBlock){
        self.cancelBlock();
    }
}


@end

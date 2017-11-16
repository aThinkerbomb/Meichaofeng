//
//  ZHCitySelectView.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/6/12.
//
//

#import "ZHCitySelectView.h"

@interface ZHCitySelectView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    //总数据源
    NSDictionary *_dicInfo;
    //选中某个省后，从dicinfo里取出放在这个里面
    NSDictionary *_provinceDic;
    //选中某个市后，从provinceDic中取出放在这里;
    NSDictionary *_cityDic;
    //所有省市的名字数组
    NSArray *_provinceNameArray;
    //城市数组
    NSArray *_cityNameArray;
    //城镇array
    NSArray *_townNameArray;
    
    
    UIPickerView *_cityPickView;
}

//上方的确定取消工具栏
@property (nonatomic, strong) UIView *toolsView;

@end


@implementation ZHCitySelectView

- (ZHSelectCityModel *)selectModel{
    if(!_selectModel){
        _selectModel = [[ZHSelectCityModel alloc]init];
    }
    return _selectModel;
}

- (void)setToolsHidden:(BOOL)toolsHidden{
    _toolsHidden = toolsHidden;
    _toolsView.hidden = toolsHidden;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"zhcity" ofType:@"plist"];
        _dicInfo = [NSDictionary dictionaryWithContentsOfFile:path];
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (int i = 0; i < _dicInfo.allKeys.count; i++) {
            NSDictionary *dic = [_dicInfo objectForKey:[@(i) stringValue]];
            
            [temp addObject:dic.allKeys[0]];
        }
        _provinceNameArray = temp;//省份数组
        
        //取第1个省,先取第1个，在用省份名字取
        _provinceDic = [[_dicInfo objectForKey:[@(0) stringValue]] objectForKey:_provinceNameArray[0]];
        _cityNameArray = [self getNameforProvince:0];//城市名字数组
        _townNameArray = [[_provinceDic objectForKey:@"0"] objectForKey:_cityNameArray[0]];
        
        
        self.selectModel.province = _provinceNameArray[0];
        self.selectModel.city = _cityNameArray[0];
        self.selectModel.area = _townNameArray[0];
        
        _cityPickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40,self.frame.size.width,self.frame.size.height-40)];
        _cityPickView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _cityPickView.layer.borderWidth = 0.0;
        _cityPickView.delegate = self;
        _cityPickView.dataSource = self;
        [self addSubview:_cityPickView];

        UIView *toolsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        toolsView.layer.borderWidth = 0.5;
        toolsView.layer.borderColor = [UIColor grayColor].CGColor;
        [self addSubview:toolsView];
        self.toolsView = toolsView;
        
        UIButton *determineBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-77, 0, 77, 40)];
        [determineBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [determineBtn setTitle:@"确定" forState:UIControlStateNormal];
        [determineBtn addTarget:self action:@selector(determineBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_toolsView addSubview:determineBtn];
        
        
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 77, 40)];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_toolsView addSubview:cancelBtn];
        
    }
    return self;
}
- (NSArray *)getNameforProvince:(NSInteger)row{
    _provinceDic = [[_dicInfo objectForKey:[@(row) stringValue]] objectForKey:_provinceNameArray[row]];
    
    NSMutableArray *temp2 = [[NSMutableArray alloc] init];
    for (int i = 0; i < _provinceDic.allKeys.count; i++) {
        NSDictionary *dic = [_provinceDic objectForKey:[@(i) stringValue]];
        [temp2 addObject:dic.allKeys[0]];
    }
    
    return temp2;
}
#pragma mark pickView-delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return _provinceNameArray.count;
    }
    else if (component == 1){
        return _cityNameArray.count;
    }else if (component == 2){
        return _townNameArray.count;
    }
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/3.0, 30)];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    if (component == 0) {
        label.text = _provinceNameArray[row];
    }else if (component == 1){
        label.text = _cityNameArray[row];
    }else if (component == 2){
        label.text = _townNameArray[row];
    }
    
    return label;
}

//三级联动从这里开始
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //这里是选中了省-然后根据省获取城市--在根据城市
    if (component == 0 ) {
        _cityNameArray = [self getNameforProvince:row];
        _townNameArray = [[_provinceDic objectForKey:@"0"] objectForKey:_cityNameArray[0]];
        [_cityPickView reloadComponent:1];
        [_cityPickView selectRow:0 inComponent:1 animated:YES];
        [_cityPickView reloadComponent:2];
        [_cityPickView selectRow:0 inComponent:2 animated:YES];
        
        self.selectModel.province = _provinceNameArray[row];
        self.selectModel.city = _cityNameArray[0];
        self.selectModel.area = _townNameArray[0];
    }else if (component == 1){  //这里是选中市的时候发生的变化
        _townNameArray = [[_provinceDic objectForKey:[@(row) stringValue]] objectForKey:_cityNameArray[row]];
        [_cityPickView reloadComponent:2];
        [_cityPickView selectRow:0 inComponent:2 animated:YES];
        
        self.selectModel.city = _cityNameArray[row];
        self.selectModel.area = _townNameArray[0];
    }else if (component == 2){
        self.selectModel.area = _townNameArray[row];
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

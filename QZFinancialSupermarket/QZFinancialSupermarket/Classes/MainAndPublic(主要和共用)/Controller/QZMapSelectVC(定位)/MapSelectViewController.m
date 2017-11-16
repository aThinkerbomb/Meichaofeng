//
//  MapSelectViewController.m
//  MapSelectDemo
//
//  Created by Adam on 2017/9/13.
//  Copyright © 2017年 Wuyunlong. All rights reserved.
//

#import "MapSelectViewController.h"

#import "MapselectTopView.h"
#import "MapCityModel.h"

#import "MapselectHotCityViewCell.h"
#import "MapselectFirstTableViewCell.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface MapSelectViewController ()<UITableViewDelegate, UITableViewDataSource, MapselectCityButtonClickDelegate>

@property (nonatomic, strong) MapselectTopView *topView;

/** 列表视图 */
@property (strong, nonatomic) UITableView *tableView;


/** 分区中心动画label */
@property (strong, nonatomic) UILabel *sectionTitle;
/** 是否开始拖拽 */
@property (assign, nonatomic, getter=isBegainDrag) BOOL begainDrag;
/** 区头视图 */
//@property (strong, nonatomic) SLCityHeadView *cityHeadView;
/** 区头数组 */
@property (strong, nonatomic) NSMutableArray *sectionArray;
/** 城市model */
@property (strong, nonatomic) MapCityModel *cityModel;

@end

@implementation MapSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0xf5f5f5);
    
    [self createUI];
}

// 分区动画标题
- (UILabel *)sectionTitle {
    if (!_sectionTitle) {
        _sectionTitle = [UILabel new];
        _sectionTitle.backgroundColor = [UIColor redColor];
        _sectionTitle.textColor = [UIColor whiteColor];
        _sectionTitle.layer.cornerRadius = 50 / 2.0;
        _sectionTitle.layer.masksToBounds = YES;
        _sectionTitle.alpha = 0;
        _sectionTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _sectionTitle;
}

- (NSMutableArray *)sectionArray {
    if (!_sectionArray) {
        _sectionArray = [NSMutableArray new];
        for (MapCityList *cityList in self.cityModel.list) {
            [_sectionArray addObject:cityList.initial];
        }
        [_sectionArray insertObject:@"热" atIndex:0];
    }
    return _sectionArray;
}

- (MapCityModel *)cityModel {
    if (!_cityModel) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"CityData.plist" ofType:nil];
        NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:path];
        _cityModel = [MapCityModel new];
        _cityModel = [_cityModel initWithDicitionary:data];
    }
    return _cityModel;
}

- (void)createUI {
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
}

// 定位视图
- (MapselectTopView *)topView {
    if (!_topView) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        _topView = [[MapselectTopView alloc] initWithFrame:CGRectMake(0, 0, width, 75 * kScaleOfX)];
        _topView.selectCityName = self.title;
    }
    return _topView;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 75 * kScaleOfX, kScreenWidth, kScreenHeight - 75 * kScaleOfX - 64) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = UIColorFromRGB(0xf5f5f5);
        _tableView.sectionIndexColor = [UIColor blueColor];
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

#pragma mark -- tableView 的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSArray *list = self.cityModel.list;
    return list.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else {
        NSArray *list = self.cityModel.list;
        MapCityList *listModel = list[section - 1];
        
        return listModel.citys.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        MapselectFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hot"];
        
        if (!cell) {
            
            NSArray *hotCity = self.cityModel.hotCity;
            cell = [[MapselectFirstTableViewCell alloc] initWithHotCityData:hotCity];
            
        }
        
        cell.delegate = self;
        
        return cell;
        
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"city"];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"city"];
        }
        
        NSArray *list = self.cityModel.list;
        MapCityList *listModel = list[indexPath.section - 1];
        MapHotCity *city = listModel.citys[indexPath.row];
        
        cell.textLabel.text = city.name;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        NSInteger floot = self.cityModel.hotCity.count / 3;
        NSInteger others = self.cityModel.hotCity.count % 3;
        
        if (others > 0) {
            floot = floot + 1;
        }
        
        return  50 * floot * kScaleOfX + 15 * kScaleOfX;
    }else {
        return 50 * kScaleOfX;
    }
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    return self.sectionArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30 * kScaleOfX;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30 * kScaleOfX)];
    contentView.backgroundColor = UIColorFromRGB(0xf5f5f5);
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kScaleOfX, 8 * kScaleOfX, 100 * kScaleOfX, 14 * kScaleOfX)];
    [contentView addSubview:contentLabel];
    contentLabel.font = [UIFont systemFontOfSize:14];
    if (section == 0) {
        contentLabel.text = @"热门城市";
    }else {
        NSArray *list = self.cityModel.list;
        MapCityList *listModel = list[section - 1];
        
        contentLabel.text = listModel.initial;
    }
    
    return contentView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) return;
    
    NSArray *list = self.cityModel.list;
    MapCityList *listModel = list[indexPath.section - 1];
    MapHotCity *city = listModel.citys[indexPath.row];
    
    self.topView.selectCityName = city.name;
    
    self.title = [NSString stringWithFormat:@"当前城市-%@",self.topView.selectCityName];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(sl_cityListSelectedCity:Id:)]) {
        [self.delegate sl_cityListSelectedCity:city.name Id:city.Id];
    }
    
    [self back];
}

//此处为热门城市按钮选择结果
- (void)citySelect:(NSString *)cityName cityId:(NSString *)cityid{
    self.topView.selectCityName = cityName;
    
    self.title = [NSString stringWithFormat:@"当前城市-%@",self.topView.selectCityName];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(sl_cityListSelectedCity:Id:)]) {
        [self.delegate sl_cityListSelectedCity:cityName Id:[cityid intValue]];
    }
    [self back];
}

@end

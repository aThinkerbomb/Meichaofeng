//
//  QZApplyRecordVC.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/1.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZApplyRecordVC.h"
#import "QZApplyRecordModel.h"
#import "SGAdvertScrollView.h"
@interface QZApplyRecordVC ()

@property (nonatomic, strong) SGAdvertScrollView * advertView;

@end

@implementation QZApplyRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (CGFloat)tableViewY {
    return 30.0;
}

- (CGFloat)otherViewHeight {
    return 30.0;
}

- (void)loadDataList {
    
    // 公告
    [self loanAdvertDataSource];
    // 列表
    [self loanApplyRecordSource];
}

- (void)setDefautUI {
    self.title = @"申请记录";
    
    // 公告
    [self.view addSubview:self.advertView];
    
    // 接入下拉刷新
    [self setMJRefresh];
    
}

#pragma mark - 申请记录请求
- (void)loanApplyRecordSource {
    
    NSString * userid = kGetObjectForKey(QZUserid);
    NSDictionary * params = @{@"id": userid?:@"0"};
    
    [QZAFNetwork postWithBaseURL:QZ_APPLY_RECORD_URL params:params success:^(NSURLSessionDataTask *task, id json) {
        
        if ([QZConfig checkResponseObject:json]) {
            NSArray *array = [NSArray yy_modelArrayWithClass:[QZApplyRecordModel class] json:json[@"data"]];
            self.dataArray = [NSMutableArray arrayWithArray:array];
            [self.tableView reloadData];
        }
        
        [self endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self endRefreshing];
    }];
    
}


#pragma mark - 贷款公告请求
- (void)loanAdvertDataSource {
    [QZAFNetwork postWithBaseURL:QZ_LOAN_ADVERT_URL success:^(NSURLSessionDataTask *task, id json) {
        NSMutableArray * titles = [NSMutableArray array];
        NSArray * data = json[@"data"];
        for (NSDictionary * dic in data) {
            
            NSString * notice =[dic objectForKey:@"notice"];
            [titles addObject:notice];
        }
        self.advertView.titles = titles;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (SGAdvertScrollView *)advertView {
    if (!_advertView) {
        _advertView = [[SGAdvertScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
//        _advertView.titles = @[@"敌军还有30秒到达战场", @"碾碎他们", @"王者审判", @"王者不可阻挡"];
        _advertView.titleColor = [UIColor colorWithHexString:@"ff2a2a"];
        _advertView.titleFont = [UIFont textFont14];
        _advertView.textAlignment = NSTextAlignmentCenter;
        _advertView.backgroundColor = [UIColor colorWithHexString:@"fffac4"];
    }
    return _advertView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

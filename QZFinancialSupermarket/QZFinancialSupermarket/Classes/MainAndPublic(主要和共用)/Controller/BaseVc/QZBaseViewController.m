//
//  QZBaseViewController.h.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#import "QZBaseViewController.h"
#import "QZNewLoginVC.h"
#import "YXNetworkReachabilityManager.h"
#import "YXStatusView.h"
#import "QZNavigationViewController.h"
@interface QZBaseViewController ()<UIGestureRecognizerDelegate, YXStatusViewDelegate>

@property (nonatomic, strong)YXStatusView *yxStatusView;

@end

@implementation QZBaseViewController

- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (ZHNavBarView *)navBarView{
    if(!_navBarView){
        _navBarView = [[ZHNavBarView alloc]init];
        _navBarView.frame = CGRectMake(0, 0, kScreenWidth, kNavBarAndStatusBarHeight);
        [self.view addSubview:_navBarView];
    }
    return _navBarView;
}

- (YXStatusView *)yxStatusView {
    if (!_yxStatusView) {
        _yxStatusView = [[[NSBundle mainBundle] loadNibNamed:@"YXStatusView" owner:self options:nil] lastObject];
        [_yxStatusView setFrame:self.view.bounds];
        _yxStatusView.delegate = self;
    }
    return _yxStatusView;
}



- (BOOL)viewWillAppearOrviewDidLoad{
    return YES;
}
- (BOOL)isNeedReachibityNetwork{
    return YES;
}

//处理左滑返回
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //当页面为一级页面时禁止手势
    if (self.navigationController.viewControllers.count <= 1){
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        return NO;
    }
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    return YES;
}
- (QZLeftBackImageType)leftBackImageType{
    return QZLeftBackImageTypeDefaut;
}
//返回按钮
- (void)back{
//    [QZWaitAnimationTool cancelRequestAndErrorViewHidden];
    if(self.backAction){
        self.backAction(self);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)disMissBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)checkInputIsNullOrCorrect{
    return YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if(self.navigationController.viewControllers.count > 1){
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"返回" target:self action:@selector(back)];
    }else{
        //        self.navigationItem.leftBarButtonItem = nil;
    }
    if([self viewWillAppearOrviewDidLoad] == NO){
        [self loadNewData];
    }
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
    // 友盟页面统计时长开始
    [QZAnalyticsManager beginLogPageView:NSStringFromClass([self class])];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 友盟页面统计时长结束
    [QZAnalyticsManager endLogPageView:NSStringFromClass([self class])];
}

- (void)loadNewData{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWith0xF0EFF5];
    
    if([self viewWillAppearOrviewDidLoad ]){
        [self loadNewData];
    }
    
    // 注册网络通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netStatusChange:) name:ZHNetStateChange object:nil];
    
    [self setDefautUI];
}

- (void)setDefautUI{
    
}

- (void)setDefautSuperUI{
    switch (self.leftBackImageType) {
        case QZLeftBackImageTypeDefaut:{
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"返回" target:self action:@selector(back)];
        }
            break;
        case QZLeftBackImageTypeArrowBack:{
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"返回" target:self action:@selector(back)];
        }
            break;
        case QZLeftBackImageTypeLoginBack:{
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"登录返回" target:self action:@selector(back)];
        }
            break;
        default:
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"QZguanbi_white" target:self action:@selector(back)];
            break;
    }
}
//网络状态监听通知方法
- (void)netStatusChange:(NSNotification *)notInfor{
    if([notInfor.name isEqual:ZHNetStateChange]){
        NSNumber *statusNumber = notInfor.object;
        NSInteger statusInt = [statusNumber integerValue];
        NetworkType type = statusInt;
        
        // 无网
        if (type == NetworkTypeNoReachable) {
            // 有数据
            if ([self isKindOfClass:[self.navigationController.topViewController class]] && self.dataArray.count > 0) {
               
                if ([self isNeedReachibityNetwork]) {
                    [self.yxStatusView setShowType:CurrentShowTypeHidden];
                    [self.yxStatusView removeFromSuperview];
                }
                
            }
            // 无数据
            if ([self isKindOfClass:[self.navigationController.topViewController class]] && self.dataArray.count <= 0) {
                
                if ([self isNeedReachibityNetwork]) {
                    [self.yxStatusView setShowType:CurrentShowTypeNoNetwork];
                    [self.view addSubview:self.yxStatusView];
                }
                
            }
            
        }
        // 有网
        if (type == NetworkTypeReachableViaWiFi || type == NetworkTypeReachableViaWWAN) {
            
            // 有数据
            if ([self isKindOfClass:[self.navigationController.topViewController class]] && self.dataArray.count > 0) {
                
                if ([self isNeedReachibityNetwork]) {
                    [self.yxStatusView setShowType:CurrentShowTypeHidden];
                    [self.yxStatusView removeFromSuperview];
                }
                
            }
            // 无数据
            if ([self isKindOfClass:[self.navigationController.topViewController class]] && self.dataArray.count <= 0) {
                
                if ([self isNeedReachibityNetwork]) {
                    [self.yxStatusView setShowType:CurrentShowTypeNoDataHasNetwork];
                    [self.view addSubview:self.yxStatusView];
                }
            }
        }
    }
}


// 点击刷新
- (void)statusViewClickedAction {
    [self loadNewData];
}


- (void)popToViewController:(Class)controller
{
    for (UIViewController *subViewController in self.navigationController.viewControllers) {
        if ([subViewController isKindOfClass:controller]) {
            [self.navigationController popToViewController:subViewController animated:YES];
        }
    }
    
}

- (BOOL)isLoginStatus {
    NSString * phone = kGetObjectForKey(QZPhone);
    NSString * userid = kGetObjectForKey(QZUserid);
    NSString * token = kGetObjectForKey(QZToken);
    if (phone && userid && token) {
        return YES;
    } else {
        QZNewLoginVC *loginVC = [[QZNewLoginVC alloc] init];
        QZNavigationViewController *nav = [[QZNavigationViewController alloc] initWithRootViewController:loginVC];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
        return NO;
    }
    
}
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

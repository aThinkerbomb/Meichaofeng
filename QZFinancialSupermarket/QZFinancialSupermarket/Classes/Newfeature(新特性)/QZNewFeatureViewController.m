//
//  QZNewFeatureViewController.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#import "QZNewFeatureViewController.h"
#import "ZHBannerView.h"
@interface QZNewFeatureViewController ()<ZHBannerViewDelegate,ZHBannerViewDataSource>

@property (nonatomic, strong) ZHBannerView *featureView;
@property (nonatomic, strong) NSArray *contentArray;
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation QZNewFeatureViewController
- (NSArray *)contentArray{
    if(!_contentArray){
        _contentArray = @[@"NewFeature1",@"NewFeature2",@"NewFeature3"];
    }
    return _contentArray;
}
- (ZHBannerView *)featureView{
    if(!_featureView){
        _featureView = [[ZHBannerView alloc]init];
        _featureView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _featureView.delegate = self;
        _featureView.dataSource = self;
        _featureView.collectionView.bounces = NO;
        _featureView.pageControl.hidden = YES;
        [self.view addSubview:_featureView];
    }
    return _featureView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.featureView reloadData];
}

#pragma mark - ZYBannerViewDataSource
// 返回Banner需要显示Item(View)的个数
- (NSInteger)numberOfItemsInBanner:(ZHBannerView *)banner
{
    return self.contentArray.count;
}
// 返回Banner在不同的index所要显示的View (可以是完全自定义的view, 且无需设置frame)
- (UIView *)banner:(ZHBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    // 创建将要显示控件
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:self.contentArray[index]];
    imageView.contentMode = UIViewContentModeScaleToFill;
    if(index == self.contentArray.count - 1){
        UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        nextBtn.size = CGSizeMake(230 * kScaleOfX, 100 * kScaleOfX);
        nextBtn.y = kScreenHeight - 55* kScaleOfX - 100 * kScaleOfX;
        nextBtn.centerX = self.view.centerX;
        nextBtn.backgroundColor = [UIColor clearColor];
        [nextBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
        if(self.nextBtn){
            [self.nextBtn removeFromSuperview];
        }
        self.nextBtn = nextBtn;
        imageView.userInteractionEnabled = YES;
        [imageView addSubview:nextBtn];
    }
    return imageView;
}

- (void)banner:(ZHBannerView *)banner didSelectItemAtIndex:(NSInteger)index{

}

- (void)nextAction{
    NSLog(@"点击了");
    // 如何知道第一次使用这个版本？比较上次的使用情况
    NSString *versionKey = @"CFBundleShortVersionString";
    // 获得当前打开软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    // 存储这次使用的软件版本
    kSetObjectForKey(currentVersion, versionKey);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 当前版本号 == 上次使用的版本：显示TabBarViewController
    [UIApplication sharedApplication].statusBarHidden = NO;
    window.rootViewController = [[QZTabBarController alloc] init];
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

//
//  QZProductPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/11.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZProductPageVC.h"
#import "TYTabButtonPagerController.h"
#import "QZProductPageItemVC.h"

#define Titlt_Height 45 *kScaleOfX
#define Line_Height 1
@interface QZProductPageVC ()<TYPagerControllerDataSource>
@property (nonatomic, strong) TYTabButtonPagerController *pagerController;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UIView *topLineView;

@end

@implementation QZProductPageVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addPagerController];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.topLineView.frame= CGRectMake(0, self.pagerController.pagerBarView.height - Line_Height,kScreenWidth, Line_Height);
    
}
#pragma mark - 控制器
- (void)addPagerController
{
    
    self.titleArray = @[@"综合",@"易通过",@"利息低",@"放款快"];

    TYTabButtonPagerController *pagerController = [[TYTabButtonPagerController alloc]init];
    pagerController.barStyle = TYPagerBarStyleNoneView;
    pagerController.dataSource = self;
    pagerController.normalTextColor = [UIColor colorWith0x666666];
    pagerController.selectedTextColor = [UIColor colorWith0x4180E9];
    pagerController.progressColor = [UIColor colorWith0xf27d00];
    pagerController.normalTextFont = [UIFont textCustomFont15];
    pagerController.selectedTextFont = [UIFont textCustomFont16];
    pagerController.adjustStatusBarHeight = YES;
    pagerController.cellWidth = kScreenWidth / self.titleArray.count;
    pagerController.cellSpacing = 0 ;
    pagerController.cellEdging = 0;
    pagerController.collectionViewBar.scrollEnabled = NO;
    //高度
    pagerController.contentTopEdging = Titlt_Height;
    [pagerController reloadData];
    pagerController.view.frame = self.view.bounds;
    pagerController.view.backgroundColor = [UIColor clearColor];
    [self addChildViewController:pagerController];
    [self.view addSubview:pagerController.view];
    self.pagerController = pagerController;
    [self.pagerController.pagerBarView addSubview:self.topLineView];

}
#pragma TYPagerControllerDataSource
- (NSInteger)numberOfControllersInPagerController
{
    return self.titleArray.count;
}
- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index
{
    return self.titleArray[index];
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index{
    QZProductPageItemVC *itemVc=[[QZProductPageItemVC alloc] init];
    itemVc.myOtherHeight = Titlt_Height + kTabBarHeigth;
    itemVc.type = index + 1;
    itemVc.nav = self.navigationController;
    return itemVc;
}

#pragma mark - lazyloading

-  (UIView *)topLineView{
    if(!_topLineView){
        _topLineView = [[UIView alloc]init];
        _topLineView.backgroundColor = [UIColor colorWith0xF0EFF5];
    }
    return _topLineView;
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

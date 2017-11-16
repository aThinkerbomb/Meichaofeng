//
//  QZNavigationViewController.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/27.
//
//

#import "QZNavigationViewController.h"

@interface QZNavigationViewController ()

@end

@implementation QZNavigationViewController

/**
 *  当第一次使用这个类的时候调用1次
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavTheme];
    
}

/**
 * 设置导航栏主题
 */
+ (void)setupNavTheme
{

    
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置显示的颜色
    //设置导航背景
    [bar setBackgroundImage: [UIImage imageWithColor:[UIColor colorWith0x4180E9]] forBarMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[[UIImage alloc] init] ];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                  NSFontAttributeName: [UIFont textCustomFont18]
                                  }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 如果push的不是根控制器(不是栈底控制器)
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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

//
//  QZAboutMeVC.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/28.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZAboutMeVC.h"

@interface QZAboutMeVC ()

@end

@implementation QZAboutMeVC

- (void)setDefautUI {
    [super setDefautUI];
    
    self.titleStr = @"关于我们";
    self.urlStr = [BaseUrl stringByAppendingPathComponent:QZ_ABOUT_OUR_URL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

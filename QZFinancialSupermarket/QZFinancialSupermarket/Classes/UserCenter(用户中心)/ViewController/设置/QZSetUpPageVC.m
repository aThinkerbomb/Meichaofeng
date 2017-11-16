//
//  QZSetUpPageVC.m
//  QZFinancialSupermarket
//
//  Created by wzh on 2017/9/13.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZSetUpPageVC.h"
#import "QZModifyPwdValidationPageVC.h"
#import "QZGoToCommentsPageVC.h"
#import "QZUserCenterItem.h"
#import "QZUserCenterCell.h"
#import "QZSetupOutLoginFooterView.h"
#import "QZVersionManager.h"
@interface QZSetUpPageVC ()<QZSetupOutLoginFooterViewDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) QZSetupOutLoginFooterView *setupOutLoginFooterView;

@end

@implementation QZSetUpPageVC


- (BOOL)isMoreSection{
    return YES;
}

- (UIView *)tableFooterView{
    if ([QZConfig isLoginStatus]) {
        return self.setupOutLoginFooterView;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}

- (void)loginOutAction {
    
    
    if ([QZConfig isLoginStatus]) {
        
        [QZAnalyticsManager event:login_back];
        
        [QZConfig loginOut];
        [self showHint:@"退出成功" delayDo:^{
            [self back];
        }];
    }
    
    // 居然退出不调接口，醉了。。。。
//    NSString *userid = kGetObjectForKey(QZUserid);
//    NSDictionary *dic = @{@"id": userid?:@""};
//
//    [QZAFNetwork postWithBaseURL:QZ_USER_LOGIN_OUT_URL params:dic success:^(NSURLSessionDataTask *task, id json) {
//
//        if ([QZConfig checkResponseObject:json]) {
//
//            [QZConfig loginOut];
//
//            [self showSuccessStatusa:json[@"message"] delayDo:^{
//                [self back];
//            }];
//        } else {
//            [self showHudWithHint:json[@"message"]];
//        }
//
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//
//    }];
}


- (void)setDefautUI{
    [self setUI];
}


- (void)nextBtnActionWithView:(QZSetupOutLoginFooterView *)footerView {
    NSLog(@"退出登录");
    [self loginOutAction];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10 *kScaleOfX;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = self.view.backgroundColor;
    return view;
}



- (void)setUI{
    __block QZSetUpPageVC *weakSelf = self;
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *firstTmpArray = [NSMutableArray array];
    NSMutableArray *secendTmpArray = [NSMutableArray array];
//    NSMutableArray *thirdTmpArray = [NSMutableArray array];

    //消息推送  暂时去掉
//    QZUserCenterItem *messagePushItem = [QZUserCenterItem itemWithTitle:@"消息推送" des:@"" isArraw:NO lineType:QZLineTypeDefaut];
//    messagePushItem.isSwitch = YES;
//    messagePushItem.selectValueAction = ^(QZUserCenterCell *cell) {
//        NSLog(@"消息推送");
//    };
//    [firstTmpArray addObject:messagePushItem];
    
    //清除缓存
    NSString *cacheDes = [QZConfig folderSize];
    QZUserCenterItem *clearCacheItem = [QZUserCenterItem itemWithTitle:@"清除缓存" des:cacheDes isArraw:NO lineType:QZLineTypeTopHiddenBottomHidden];
    clearCacheItem.selectValueAction = ^(QZUserCenterCell *cell){
        NSLog(@"清除缓存");
        [QZConfig removeCache];
        [weakSelf showHint:@"清理成功"];
        QZUserCenterItem * clearItem = firstTmpArray[0];
        clearItem.des = @"0.00k";
        [weakSelf.tableView reloadData];
    };
    [firstTmpArray addObject:clearCacheItem];
    [array addObject:firstTmpArray];

    
    //修改密码
//    QZUserCenterItem *modifyPwdItem = [QZUserCenterItem itemWithTitle:@"修改密码" des:@"" isArraw:YES lineType:QZLineTypeTopHiddenBottomHidden];
//    modifyPwdItem.selectValueAction = ^(QZUserCenterCell *cell){
//        NSLog(@"修改密码");
//
//        if ([weakSelf isLoginStatus]) {
//            QZModifyPwdValidationPageVC *modifyPwdValidationPageVc = [[QZModifyPwdValidationPageVC alloc]init];
//            [weakSelf.navigationController pushViewController:modifyPwdValidationPageVc animated:YES];
//        }
//
//
//    };
//    [secendTmpArray addObject:modifyPwdItem];
//    [array addObject:secendTmpArray];
    
    
    //去评价
    QZUserCenterItem *goToEvaluationItem = [QZUserCenterItem itemWithTitle:@"去评价" des:@"" isArraw:YES lineType:QZLineTypeDefaut];
    goToEvaluationItem.selectValueAction = ^(QZUserCenterCell *cell){
        NSLog(@"去评价");
        
        if ([weakSelf isLoginStatus]) {
            QZGoToCommentsPageVC *goToCommentsPageVc = [[QZGoToCommentsPageVC alloc]init];
            goToCommentsPageVc.enterType = QZEnterTypeTypeFeedback;
            [weakSelf.navigationController pushViewController:goToCommentsPageVc animated:YES];
        }
        
        
    };
    [secendTmpArray addObject:goToEvaluationItem];
    
    
    
    //版本号
    NSString * update = kGetObjectForKey(ShouldUpdateVersion); // 是否需要显示升级
    BOOL show = [update intValue] ? YES : NO;
    QZUserCenterItem *versionItem = [QZUserCenterItem itemWithTitle:@"版本号" des:[ZHTool getCurrentVersion] isArraw:NO lineType:QZLineTypeTopHiddenBottomHidden showNewVersion:show];
    versionItem.selectValueAction = ^(QZUserCenterCell *cell){
        NSLog(@"版本号");
        
        if (update) {
            // 开启版本检测
            [[QZVersionManager shareInstance] startCheckVersion];
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tap setNumberOfTapsRequired:10];
        [cell addGestureRecognizer:tap];
    };
    [secendTmpArray addObject:versionItem];
    [array addObject:secendTmpArray];
    
    
    
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:array];
    
    [self.tableView reloadData];
    
}

- (void)tapAction:(UIGestureRecognizer *)gesture {
    
    NSString *title = [QZConfig getCurrentEnvirModel];
    
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"线上模式(正式环境)", @"开发者模式(测试环境)",nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex != 2) {
        
        // 存储buttonIndex  要注意和枚举的相互对应
        kSetObjectForKey(@(buttonIndex), BaseUrlKey);
        kSetObjectForKey(@(buttonIndex), BaseUrlImageKey);
        
        // 登出
        [QZConfig loginOut];
        
        // 返回
        [self back];
    }
}


- (QZSetupOutLoginFooterView *)setupOutLoginFooterView{
    if(!_setupOutLoginFooterView){
        _setupOutLoginFooterView = [[QZSetupOutLoginFooterView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100 *kScaleOfX)];
        _setupOutLoginFooterView.delegate = self;
    }
    return _setupOutLoginFooterView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

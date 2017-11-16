//
//  QZVersionManager.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/11/2.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZVersionManager.h"
#import "VersionModel.h"
#import "QZVersionUpdateView.h"

@interface QZVersionManager ()

@property (nonatomic, strong) QZVersionUpdateView *updateView;

@end


@implementation QZVersionManager

+ (instancetype)shareInstance {
    
    static QZVersionManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[QZVersionManager alloc] init];
        
    });
    return manager;
}

- (void)startCheckVersion {
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:[ZHTool getCurrentVersion] forKey:@"appid"];
    [params setObject:@"2" forKey:@"type"];
    
    [QZAFNetwork postWithBaseURL:QZ_VERSION_CODE_URL params:params success:^(NSURLSessionDataTask *task, id json) {
        
        if (![ZHTool isEmptyOrNullWithObject:json[@"data"]]) {
            
            VersionModel *versionModel = [[VersionModel alloc] initWithJson:json[@"data"]];
            
            if ([self checkUpdateWithNewVersion:versionModel.version]) {
                
                // 提示更新
                
                // 更新内容
                self.updateView.updateMsgs = [versionModel.content componentsSeparatedByString:@"-"];
                // 更新标题
                self.updateView.updateTip = versionModel.name;
                // 强弱更新
                NSInteger force = [versionModel.force integerValue];
                if (force == 1) {
                    self.updateView.isNeedUpdate = YES;
                } else {
                    self.updateView.isNeedUpdate = NO;
                }
                
                [self.updateView gotoUpdateVersion:^(NSInteger idex) {
                    if (idex == 0) {
                        // 点击取消 发送通知，去展示推荐活动页
                        [[NSNotificationCenter defaultCenter] postNotificationName:ShowRecommendActivityName object:nil userInfo:@{@"show": @"0"}];
                    }
                    if (idex == 1) {
                        // 点击更新 发送通知，不展示推荐活动页
                        [[NSNotificationCenter defaultCenter] postNotificationName:ShowRecommendActivityName object:nil userInfo:@{@"show": @"1"}];
                    }
                    
                }];
                
                [self.updateView show];
            }
            
        } else {
            // 最新版本 发送通知， 去展示推荐活动页
            [[NSNotificationCenter defaultCenter] postNotificationName:ShowRecommendActivityName object:nil userInfo:@{@"show": @"0"}];
            // 最新版本 不用更新
            kSetObjectForKey(@"0", ShouldUpdateVersion);
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

// 检测版本是否需要更新
- (BOOL)checkUpdateWithNewVersion:(NSString *)newVerison{
    
    if (newVerison.length <= 0) {
        kSetObjectForKey(@"0", ShouldUpdateVersion); // 存储一下，在设置页面用到
        return NO;
    }
    
    NSString *oldVersion = [ZHTool getCurrentVersion];
    
    NSArray *old = [oldVersion componentsSeparatedByString:@"."];
    NSArray *new = [newVerison componentsSeparatedByString:@"."];
    
    for (int i = 0; i < 3; i++) {
        NSInteger newCode = [new[i] intValue];
        NSInteger oldcode = [old[i] intValue];
        if (newCode > oldcode) {
            kSetObjectForKey(@"1", ShouldUpdateVersion);
            return  YES;
        }
        
    }
    
    kSetObjectForKey(@"0", ShouldUpdateVersion);
    return NO;
}

// getter ----
- (QZVersionUpdateView *)updateView {
    if (!_updateView) {
        
        _updateView = [[[NSBundle mainBundle] loadNibNamed:@"QZVersionUpdateView" owner:nil options:nil]lastObject];
        [_updateView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _updateView;
}



@end

//
//  QZConfig.m
//  QZFinancialSupermarket
//
//  Created by 张宇轩 on 2017/9/25.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "QZConfig.h"

@implementation QZConfig

+(BOOL)checkResponseObject:(id)json {
    
    BOOL result = NO;
    NSInteger status = [[json objectForKey:@"code"] integerValue];
    NSString * success = [json objectForKey:@"success"];
    if (status == 200 && [success isEqualToString:@"true"]) {
        result = YES;
    } else if (status == 203) {
        [self showHint_object:@"请重新登录"];
        [QZConfig loginOut];
        result = NO;
    } else {
        NSString * msg = json[@"message"];
        if (status == 201 && [msg containsString:@"token为空"]) {
            [self showHint_object:@"请重新登录"];
            [QZConfig loginOut];
            result = NO;
        } else {
            [self showHint_object:json[@"message"]];
            result = NO;
        }
        
    }
    return result;
}

+ (NSString *)getHandlePhone:(NSString *)phone {
    NSString *newPhone = phone;
    
    newPhone = [newPhone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    return newPhone;
    
}

+ (NSString *)getCompleteURLWithParameterDic:(NSDictionary *)parameter url:(NSString *)url{
    
    NSString * newUrl = @"";
    if (parameter.count == 0) {
        return newUrl;
    }
    
    NSArray * keys = [parameter allKeys];
    NSMutableArray * array = [NSMutableArray array];
    for (NSString *key in keys) {
        NSString * str = [[key stringByAppendingString:@"="] stringByAppendingString:[NSString stringWithFormat:@"%@", [parameter objectForKey:key]]];
        [array addObject:str];
    }
    NSString *str2 = [array componentsJoinedByString:@"&"];
    newUrl = [[[BaseUrl stringByAppendingPathComponent:url] stringByAppendingString:@"?"] stringByAppendingString:str2];
    return newUrl;
    
}

// 缓存大小
+ (NSString *)folderSize{
    CGFloat folderSize = 0.0;
    
    //获取路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    
    //获取所有文件的数组
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%ld",files.count);
    
    for(NSString *path in files) {
        
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        
        //累加
        folderSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    //转换为M为单位
    CGFloat sizeM = folderSize /1024.0/1024.0;
    
    NSString *message = sizeM > 1 ? [NSString stringWithFormat:@"%.2fM", sizeM] : [NSString stringWithFormat:@"%.2fK", sizeM * 1024.0];
    
    return message;
}

+ (void)removeCache{
    //===============清除缓存==============
    //获取路径
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    
    //返回路径中的文件数组
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    
    NSLog(@"文件数：%ld",[files count]);
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                NSLog(@"清除成功");
                //这里发送一个通知给外界，外界接收通知，可以做一些操作（比如UIAlertViewController）
                
            }else{
                
                NSLog(@"清除失败");
                
            }
        }
    }
}

+ (NSString *)getBaseUrlConfigure {
    
    NSString * value = kGetObjectForKey(BaseUrlKey);
    NSInteger baseUrlStatus = [value integerValue];
    
    NSString * url = @"http://106.75.18.183/";
    
    if (baseUrlStatus == BaseUrlStatusDistribution) {
        url = @"http://106.75.18.183/";
    } else if (baseUrlStatus == BaseUrlStatusDevelopment) {
        url = @"http://192.168.1.31:8081/";
    }
    
    return url;
}

+ (NSString *)getImageBaseUrlConfigure {
    
    NSString * value = kGetObjectForKey(BaseUrlImageKey);
    NSInteger BaseUrlStatus = [value integerValue];
    
    NSString * url = @"http://donlad.ufile.ucloud.com.cn";
    
    if (BaseUrlStatus == BaseUrlStatusDistribution) {
        url = @"http://donlad.ufile.ucloud.com.cn";
    } else if (BaseUrlStatus == BaseUrlStatusDevelopment) {
        url = @"http://donlad.ufile.ucloud.com.cn";
    }
    
    return url;
}

+ (NSString *)getCurrentEnvirModel {
    NSString *title = @"";
    NSString *value = kGetObjectForKey(BaseUrlKey);
    NSInteger baseUrlStatus = [value integerValue];
    title = baseUrlStatus ? @"当前：测试环境" : @"当前：正式环境";
    return title;
}

+ (BOOL)isLoginStatus {
    NSString * phone = kGetObjectForKey(QZPhone);
    NSString * userid = kGetObjectForKey(QZUserid);
    NSString * token = kGetObjectForKey(QZToken);
    if (phone && userid && token) {
        return YES;
    }
    return NO;
}

+ (void)loginOut {
    kRemoveObjectForKey(QZUserid);
    kRemoveObjectForKey(QZToken);
//    kRemoveObjectForKey(QZPhone);
}

@end

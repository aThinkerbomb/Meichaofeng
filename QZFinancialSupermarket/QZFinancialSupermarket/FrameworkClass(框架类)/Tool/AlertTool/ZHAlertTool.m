//
//  QZAlertTool.m
//  QZFinancialSupermarket
//
//  Created by wzh on 17/3/7.
//
//

#import "ZHAlertTool.h"

@implementation ZHAlertTool
+ (UIAlertController *)alertCancelMesasge:(NSString *)message nextHandler:(void(^)())nextHandler{
    return [self alertCancelMesasgeWithTitle:@"" mesasge:message nextHandler:nextHandler];
}
+ (UIAlertController *)alertCancelMesasgeWithTitle:(NSString *)title mesasge:(NSString *)message nextHandler:(void(^)())nextHandler{
    UIViewController *vc = [[[UIApplication sharedApplication].delegate window] rootViewController];
    return [self alertOneTitle:title mesasge:message nextTitle:@"取消" nextHandler:nextHandler viewContrller:vc];
}
+ (UIAlertController *)alertMesasge:(NSString *)message nextHandler:(void(^)())nextHandler{
    return [self alertMesasgeWithTitle:@"" mesasge:message nextHandler:nextHandler];
}
+ (UIAlertController *)alertMesasgeWithTitle:(NSString *)title mesasge:(NSString *)message nextHandler:(void(^)())nextHandler{
    UIViewController *vc = [[[UIApplication sharedApplication].delegate window] rootViewController];
    return [self alertOneTitle:title mesasge:message nextTitle:@"确定" nextHandler:nextHandler viewContrller:vc];
}




+ (UIAlertController *)alertCancelMesasge:(NSString *)message{
    return [self alertCancelMesasgeWithTitle:@"" mesasge:message];
}
+ (UIAlertController *)alertCancelMesasgeWithTitle:(NSString *)title  mesasge:(NSString *)message{
    UIViewController *vc = [[[UIApplication sharedApplication].delegate window] rootViewController];
    UIAlertController *alertVC = [self alertOneTitle:title mesasge:message nextTitle:@"取消" nextHandler:^{
        //修复bug
        if ([NSThread isMainThread]){
            [vc dismissViewControllerAnimated:YES completion:nil];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [vc dismissViewControllerAnimated:YES completion:nil];
            });
        }
    } viewContrller:vc];
    return alertVC;
}

+ (UIAlertController *)alertMesasge:(NSString *)message{
    return [self alertRightDetermineWithTitle:@"" mesasge:message];
}

+ (UIAlertController *)alertRightDetermineWithTitle:(NSString *)title  mesasge:(NSString *)message {
    UIViewController *vc = [[[UIApplication sharedApplication].delegate window] rootViewController];
    UIAlertController *alertVC = [self alertOneDetermineWithTitle:title mesasge:message viewContrller:vc];
    return alertVC;
}





+ (UIAlertController *)alertOneDetermineWithTitle:(NSString *)title  mesasge:(NSString *)message viewContrller:(UIViewController*)vc{
    UIAlertController *alertVC = [self alertOneTitle:title mesasge:message nextTitle:@"确定" nextHandler:^{
        if ([NSThread isMainThread]){
            [vc dismissViewControllerAnimated:YES completion:nil];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [vc dismissViewControllerAnimated:YES completion:nil];
            });
        }
    } viewContrller:vc];
    return alertVC;
}

+ (UIAlertController *)alertOneEventDissWithTitle:(NSString *)title  mesasge:(NSString *)message nextTitle:(NSString *)nextTitle viewContrller:(UIViewController*)vc{
    UIAlertController *alertVC = [self alertOneTitle:title mesasge:message nextTitle:nextTitle nextHandler:^{
        if ([NSThread isMainThread]){
            [vc dismissViewControllerAnimated:YES completion:nil];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [vc dismissViewControllerAnimated:YES completion:nil];
            });
        }
    } viewContrller:vc];
    return alertVC;
}



+ (UIAlertController *)alertOneTitle:(NSString *)title  mesasge:(NSString *)message nextTitle:(NSString *)nextTitle nextHandler:(void(^)())nextHandler viewContrller:(UIViewController*)vc{
    return [self alertTitle:title mesasge:message leftTitle:nil rightTitle:nextTitle leftHandler:nil rightHandler:nextHandler viewContrller:vc];
}





+ (UIAlertController *)alertLeftCancelWithTitle:(NSString *)title  rightTitle:(NSString *)rightTitle rightHandler:(void (^)())rightHandler viewContrller:(UIViewController*)vc{
    UIAlertController *alertVC =  [self alertTitle:title leftTitle:@"取消" rightTitle:rightTitle leftHandler:^{
        if ([NSThread isMainThread]){
            [vc dismissViewControllerAnimated:YES completion:nil];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [vc dismissViewControllerAnimated:YES completion:nil];
            });
        }
    } rightHandler:rightHandler viewContrller:vc];
    return alertVC;
}

+ (UIAlertController *)alertTitle:(NSString *)title leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle leftHandler:(void (^)())leftHandler rightHandler:(void (^)())rightHandler viewContrller:(UIViewController*)vc{
    return [self alertTitle:title mesasge:nil leftTitle:leftTitle rightTitle:rightTitle leftHandler:leftHandler rightHandler:rightHandler viewContrller:vc];
}

+ (UIAlertController *)alertLeftCancelAndRightDetermineWithTitle:(NSString *)title mesasge:(NSString *)message cancelHandler:(void (^)())cancelHandler confirmHandler:(void (^)())confirmHandler viewContrller:(UIViewController*)vc{
    return [self alertTitle:title mesasge:message leftTitle:@"取消" rightTitle:@"确定" leftHandler:cancelHandler rightHandler:confirmHandler viewContrller:vc];
}

+ (UIAlertController *)alertLeftCancelAndRightDetermineWithTitle:(NSString *)title mesasge:(NSString *)message rightHandler:(void (^)())rightHandler viewContrller:(UIViewController*)vc{
    UIAlertController *alertVC = [self alertLeftCancelWithTitle:title mesasge:message rightTitle:@"确定" rightHandler:rightHandler viewContrller:vc];
    return alertVC;
}
+ (UIAlertController *)alertLeftCancelWithTitle:(NSString *)title mesasge:(NSString *)message  rightTitle:(NSString*)rightTitle rightHandler:(void(^)())rightHandler  viewContrller:(UIViewController*)vc{
    UIAlertController *alertVC = [self alertTitle:title mesasge:message leftTitle:@"取消" rightTitle:rightTitle leftHandler:^{
        if ([NSThread isMainThread]){
            [vc dismissViewControllerAnimated:YES completion:nil];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [vc dismissViewControllerAnimated:YES completion:nil];
            });
        }
    }  rightHandler:rightHandler viewContrller:vc];
    return alertVC;
}
+ (UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message leftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle leftHandler:(void(^)())leftHandler rightHandler:(void(^)())rightHandler{
    return [self alertTitle:title mesasge:message leftTitle:leftTitle rightTitle:rightTitle leftHandler:leftHandler rightHandler:rightHandler viewContrller:[UIApplication sharedApplication].windows.lastObject.rootViewController];
}
//有取消按钮的
+ (UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message leftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle leftHandler:(void(^)())leftHandler rightHandler:(void(^)())rightHandler viewContrller:(UIViewController*)vc{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if(leftTitle){
        UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleCancel handler:leftHandler];
        [alertController addAction:leftAction];
    }

    if(rightTitle){
        UIAlertAction *rightAction=[UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:rightHandler];
        [alertController addAction:rightAction];
    }
    
    [vc presentViewController:alertController animated:YES completion:nil];
    return alertController;
}


+ (UIAlertController *)alertCallTelWithCancelHandler:(void(^)())cancelHandler callHandler:(void(^)())callHandler viewContrller:(UIViewController*)vc{
    NSString *title = @"客户端专享服务热线";
    NSString *message = [NSString stringWithFormat:@"（工作日9：30-17：30 ； 周六日9：00-17：00）\n%@",QZServerTelePhone];
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancelHandler];
        [alertController addAction:leftAction];
    
    UIAlertAction *rightAction=[UIAlertAction actionWithTitle:@"拨打" style:UIAlertActionStyleDefault handler:callHandler];
    [alertController addAction:rightAction];
    
    
    //修改title
    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:title];
    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith0x29344a] range:NSMakeRange(0,title.length)];
    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont textCustomFont16] range:NSMakeRange(0, title.length)];
    [alertController setValue:alertControllerStr forKey:@"attributedTitle"];
    
    //修改message
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith0x999999] range:NSMakeRange(0, message.length)];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont textCustomFont12] range:NSMakeRange(0, message.length)];
    
    NSRange setRange = [message rangeOfString:QZServerTelePhone];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWith0xf27d00] range:setRange];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont textCustomFont18] range:setRange];
    
    [alertController setValue:alertControllerMessageStr forKey:@"attributedMessage"];
    
    //修改按钮
    if ([leftAction valueForKey:@"titleTextColor"]) {
        [leftAction setValue:[UIColor colorWith0x29344a] forKey:@"titleTextColor"];
    }
    if ([rightAction valueForKey:@"titleTextColor"]) {
        [rightAction setValue:[UIColor colorWith0xf27d00] forKey:@"titleTextColor"];
    }
    [vc presentViewController:alertController animated:YES completion:nil];
    return alertController;
}

+ (ZHAlertView *)showCallTelAlertView:(UIView *)containerView  animated:(BOOL)animated{
    
    
   ZHAlertView *alertView =  [self showCallTelAlertView:containerView leftHandler:^{
    } rightHandler:^{
        [ZHTool callPhoneTel];
    } animated:YES];
    [alertView.leftBtn title:@"取消" titleColor:[UIColor colorWith0x29344a] titleFont:[UIFont textCustomFont16]];
    [alertView.rightBtn title:@"拨打" titleColor:[UIColor colorWith0xf27d00] titleFont:[UIFont textCustomFont16]];
    [alertView.titleLab text:@"客户端专享服务热线" textColor:[UIColor colorWith0x29344a] textFont:[UIFont textCustomFont16]];
    [alertView.desLab text:@"（工作日9:30-17:30 ; 周六日9:00-17:00）" textColor:[UIColor colorWith0x999999] textFont:[UIFont textCustomFont14]];
    [alertView.messageLab text:QZServerTelePhone textColor:[UIColor colorWith0xf27d00] textFont:[UIFont textCustomFont20]];

    return alertView;
}


+ (ZHAlertView *)showCallTelAlertView:(UIView *)containerView leftHandler:(void(^)())leftHandler rightHandler:(void(^)())rightHandler animated:(BOOL)animated{
    ZHAlertView *alertView = [[ZHAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    if(animated){
        [alertView.contentView.layer addBeatingAnimationWithDuration:0.5];
    }
    alertView.leftHandler = leftHandler;
    alertView.rightHandler = rightHandler;
    [containerView addSubview:alertView];
    return alertView;
    
}


/*
+ (UIAlertController *)alertWithConfirmTitle:(NSString *)title mesasge:(NSString *)message{
    UIAlertController *alertVC =  [self alertTitle:title mesasge:message nextTitle:@"确定" nextHandler:^{
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }];
    return alertVC;
}

+ (UIAlertController *)alertWithConfirmTitle:(NSString *)title mesasge:(NSString *)message  nextHandler:(void(^)())nextHandler{
    return [self alertTitle:title mesasge:message nextTitle:@"确定" nextHandler:nextHandler];
}

+ (UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message nextTitle:(NSString*)nextTitle  nextHandler:(void(^)())nextHandler{
    return [self alertTitle:title mesasge:message nextTitle:nextTitle nextHandler:nextHandler viewContrller:[[UIApplication sharedApplication].delegate window].rootViewController];
}

+ (UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message nextTitle:(NSString*)nextTitle  nextHandler:(void(^)())nextHandler  viewContrller:(UIViewController*)vc{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *nextAction = [UIAlertAction actionWithTitle:nextTitle style:UIAlertActionStyleCancel handler:nextHandler];
    [alertController addAction:nextAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}
*/

@end

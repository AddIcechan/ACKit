//
//  UIAlertController+ACKit.m
//  ACKit
//
//  Created by ADDICE on 2017/12/19.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import "UIAlertController+ACKit.h"

@implementation UIAlertController (ACKit)

+ (void)showAlertWithController:(UIViewController *)controller
                          title:(NSString *)title
                        message:(NSString *)message
              completionHandler:(void (^)(NSInteger))completionHandler
                    cancelTitle:(NSString *)cancelTitle
                       btnTitle:(NSString *)btnTitle, ... {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    NSInteger btnIndex = 0;
    if (btnTitle && btnTitle.length > 0) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            !completionHandler ?: completionHandler(btnIndex);
        }];
        [alertController addAction:action];
        btnIndex += 1;
        
        va_list values;
        // values 会从 value 的指针地址开始取值，直至nil
        va_start(values, btnTitle);
        NSString *tempValue;
        while((tempValue = va_arg(values, NSString *))) {
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:tempValue style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                !completionHandler ?: completionHandler(btnIndex);
            }];
            [alertController addAction:action];
            btnIndex += 1;
        }
        
        // 记得清空
        va_end(values);
    }
    
    if (cancelTitle.length > 0) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            !completionHandler ?: completionHandler(btnIndex);
        }];
        [alertController addAction:action];
    } else {
        NSAssert(cancelTitle == nil, @"cancel title can not be nil");
        NSAssert(cancelTitle.length == 0, @"cancel title length is 0~~");
    }
    
    [controller presentViewController:alertController animated:YES completion:nil];
    
}

@end

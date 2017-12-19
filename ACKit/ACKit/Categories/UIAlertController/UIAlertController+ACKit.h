//
//  UIAlertController+ACKit.h
//  ACKit
//
//  Created by ADDICE on 2017/12/19.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIAlertController (ACKit)

/**
 弹出 alert 弹窗
 
 @param controller 所附庸的controler
 @param title title，可为nil
 @param message message, 可为nil
 @param completionHandler 一个肥调～用于 alert 的button 事件处理。cancel button 位于最大index指, 不可为 nil
 @param cancelTitle canceltitle, 不可为nil
 @param btnTitle alert button title，多个参数
 */
+ (void)showAlertWithController:(UIViewController *)controller
                          title:(nullable NSString *)title
                        message:(nullable NSString *)message
              completionHandler:(nullable void(^)(NSInteger btnIndex))completionHandler
                    cancelTitle:(NSString *)cancelTitle
                       btnTitle:(nullable NSString *)btnTitle, ... NS_REQUIRES_NIL_TERMINATION;

@end
NS_ASSUME_NONNULL_END


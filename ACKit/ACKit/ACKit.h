//
//  ACKit.h
//  ACKit
//
//  Created by ADDICE on 2017/12/18.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#ifndef ACKit_h
#define ACKit_h

#pragma mark - functions

typedef void(^ACKitVoidHandler)(void);

/**
 保证在主线程刷新的一个异步方法

 @param handler 一个肥调
 */
static inline void safeAsyncHandlerInMainThread(ACKitVoidHandler handler) {
    
    if ([NSThread isMainThread]) {
        handler();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            handler();
        });
    }
}

/**
 保证在主线程刷新的一个同步方法
 
 @param handler 一个肥调
 */
static inline void safeSyncHandlerInMainThread(ACKitVoidHandler handler) {
    if ([NSThread isMainThread]) {
        handler();
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            handler();
        });
    }
}

#pragma mark - 

#import "NSString+ACKit.h"
#import "NSArray+ACKit.h"

#import "UIView+ACKit.h"
#import "UIDevice+ACKit.h"
#import "UIButton+ACKit.h"
#import "UIViewController+ACKit.h"
#import "UIAlertController+ACKit.h"

#endif /* ACKit_h */

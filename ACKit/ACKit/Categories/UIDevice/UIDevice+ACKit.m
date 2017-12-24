//
//  UIDevice+Extension.m
//  ACKit
//
//  Created by ADDICE on 2017/12/18.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import "UIDevice+ACKit.h"

inline BOOL iPhone4s(void) {
    static BOOL is_4s;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen mainScreen].bounds.size;
        is_4s = ((NSInteger)MAX(size.width, size.height)) == 480;
    });
    return is_4s;
}

inline BOOL iPhoneSE(void) {
    static BOOL is_SE;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen mainScreen].bounds.size;
        is_SE = ((NSInteger)MAX(size.width, size.height)) == 568;
    });
    return is_SE;
}

inline BOOL iPhone8(void) {
    static BOOL is_iPhone8;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen mainScreen].bounds.size;
        is_iPhone8 = ((NSInteger)MAX(size.width, size.height)) == 667;
    });
    return is_iPhone8;
}

inline BOOL iPhone8Plus(void) {
    static BOOL is_8Plus;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen mainScreen].bounds.size;
        is_8Plus = ((NSInteger)MAX(size.width, size.height)) == 736;
    });
    return is_8Plus;
}

inline BOOL iPhoneX(void) {
    static BOOL is_iPhoneX;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen mainScreen].bounds.size;
        is_iPhoneX = ((NSInteger)MAX(size.width, size.height)) == 812;
    });
    return is_iPhoneX;
}

@implementation UIDevice (Extension)



@end

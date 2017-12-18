//
//  UIDevice+Extension.m
//  ACKit
//
//  Created by ADDICE on 2017/12/18.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import "UIDevice+ACKit.h"

BOOL iPhoneX(void) {
    static BOOL result;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen mainScreen].bounds.size;
        result = MAX(size.width, size.height) == 812;
    });
    return result;
}

@implementation UIDevice (Extension)

@end

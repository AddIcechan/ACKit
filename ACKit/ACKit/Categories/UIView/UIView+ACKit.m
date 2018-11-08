//
//  UIView+ACKit.m
//  ACKit
//
//  Created by ADDICE on 2017/12/20.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import "UIView+ACKit.h"
#import <objc/runtime.h>

@implementation UIView (AC_FrameExtention)

#pragma mark - origin
- (CGPoint)ac_origin {
    return self.frame.origin;
}

- (void)setAc_origin:(CGPoint)ac_origin {
    CGRect rect = self.frame;
    rect.origin = ac_origin;
    self.frame = rect;
}

- (CGFloat)ac_top {
    return self.frame.origin.y;
}

- (void)setAc_top:(CGFloat)ac_top {
    CGRect rect = self.frame;
    rect.origin.y = ac_top;
    self.frame = rect;
}

- (CGFloat)ac_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setAc_bottom:(CGFloat)ac_bottom {
    CGRect rect = self.frame;
    rect.origin.y = ac_bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)ac_left {
    return self.frame.origin.x;
}

- (void)setAc_left:(CGFloat)ac_left {
    CGRect rect = self.frame;
    rect.origin.x = ac_left;
    self.frame = rect;
}

- (CGFloat)ac_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setAc_right:(CGFloat)ac_right {
    CGRect rect = self.frame;
    rect.origin.x = ac_right - rect.size.width;
    self.frame = rect;
}

#pragma mark - size

- (CGSize)ac_size {
    return self.frame.size;
}

- (void)setAc_size:(CGSize)ac_size {
    CGRect rect = self.frame;
    rect.size = ac_size;
    self.frame = rect;
}

- (CGFloat)ac_width {
    return self.frame.size.width;
}

- (void)setAc_width:(CGFloat)ac_width {
    CGRect rect = self.frame;
    rect.size.width = ac_width;
    self.frame = rect;
}

- (CGFloat)ac_height {
    return self.frame.size.height;
}

- (void)setAc_height:(CGFloat)ac_height {
    CGRect rect = self.frame;
    rect.size.height = ac_height;
    self.frame = rect;
}

@end

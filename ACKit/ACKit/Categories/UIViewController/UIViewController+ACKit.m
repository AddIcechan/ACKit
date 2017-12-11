//
//  UIViewController+ACKit.m
//  ACKit
//
//  Created by ADDICE on 2017/12/11.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import "UIViewController+ACKit.h"
#import <objc/runtime.h>

@implementation UIViewController (ACKit)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(ac_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)ac_viewWillAppear:(BOOL)animated {
    [self ac_viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:self.ac_newStatusBarStyle];
    
    [self.navigationController setNavigationBarHidden:self.ac_navgationBarHidden animated:YES];
    
    [self.navigationController.navigationBar setBarTintColor:self.ac_navBarBackgroundColor];
    
    if (self.ac_navBarBackgroundImage) {
        [self.navigationController.navigationBar setBackgroundImage:self.ac_navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    }
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: self.ac_navBarTextColor}];
    
}

- (UIColor *)ac_navBarBackgroundColor {
    return objc_getAssociatedObject(self, _cmd) ?: ac_defaultNavBarBackgourndColor();
}

- (void)setAc_navBarBackgroundColor:(UIColor *)ac_navBarBackgroundColor {
    objc_setAssociatedObject(self, @selector(ac_navBarBackgroundColor), ac_navBarBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)ac_navBarBackgroundImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAc_navBarBackgroundImage:(UIImage *)ac_navBarBackgroundImage {
    objc_setAssociatedObject(self, @selector(ac_navBarBackgroundImage), ac_navBarBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)ac_navBarTextColor {
    return objc_getAssociatedObject(self, _cmd) ?: ac_defaultNavBarTextColor();
}

- (void)setAc_navBarTextColor:(UIColor *)ac_navBarTextColor {
    objc_setAssociatedObject(self, @selector(ac_navBarTextColor), ac_navBarTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIStatusBarStyle)ac_newStatusBarStyle {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setAc_newStatusBarStyle:(UIStatusBarStyle)ac_newStatusBarStyle {
    return objc_setAssociatedObject(self, @selector(ac_newStatusBarStyle), @(ac_newStatusBarStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)ac_navgationBarHidden {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAc_navgationBarHidden:(BOOL)ac_navgationBarHidden {
    objc_setAssociatedObject(self, @selector(ac_navgationBarHidden), @(ac_navgationBarHidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

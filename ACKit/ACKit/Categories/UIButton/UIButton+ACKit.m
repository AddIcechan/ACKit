//
//  UIButton+ACKit.m
//  ACKit
//
//  Created by ADDICE on 2018/4/8.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import "UIButton+ACKit.h"
#import <objc/runtime.h>

static NSString * const kColorForNormal = @"UIControlStateNormal";
static NSString * const kColorForHighlighted = @"UIControlStateHighlighted";
static NSString * const kColorForDisabled = @"UIControlStateDisabled";
static NSString * const kColorForSelected = @"UIControlStateSelected";
static NSString * const kColorForFocused = @"UIControlStateFocused";
static NSString * const kColorForApplication = @"UIControlStateApplication";
static NSString * const kColorForReserved = @"UIControlStateReserved";

@interface UIButton()

@property (nonatomic, strong) NSMutableDictionary *bgColorDict;

@end

@implementation UIButton (ACKit)
/* 
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        [self swizzleClass:class originalSelector:@selector(setSelected:) swizzledSelector:@selector(ac_setSelected:)];

        [self swizzleClass:class originalSelector:@selector(setHighlighted:) swizzledSelector:@selector(ac_setHighlighted:)];

        [self swizzleClass:class originalSelector:@selector(setEnabled:) swizzledSelector:@selector(ac_setEnabled:)];
        
    });
}
 */

+ (void)swizzleClass:(Class)class originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)ac_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    
    if (!backgroundColor) return;
    
    if (!self.bgColorDict) self.bgColorDict = [NSMutableDictionary dictionary];
    
    NSString *key = [self fetchBgColorKey:state];
    self.bgColorDict[key] = backgroundColor;
    
    UIImage *bgImgColor = [self imageWithColor:backgroundColor];
    
    [self setBackgroundImage:bgImgColor forState:state];
    
//    NSLog(@"%@",self.bgColorDict);
//    if (state == UIControlStateNormal) {
//        self.backgroundColor = backgroundColor;
//    }
}

- (UIColor *)ac_backgroundColorForState:(UIControlState)state {
    NSString *key = [self fetchBgColorKey:state];
    return self.bgColorDict[key];
}

- (void)ac_setSelected:(BOOL)selected {
    [self ac_setSelected:selected];
    NSString *key = [self fetchBgColorKey:(YES == selected ? UIControlStateSelected : UIControlStateNormal)];
    UIColor *bgColor = self.bgColorDict[key];
    if (bgColor) [self setBackgroundColor:bgColor];
}

- (void)ac_setHighlighted:(BOOL)highlighted {
    [self ac_setHighlighted:highlighted];
    
    if (highlighted) {
        NSString *key = [self fetchBgColorKey: UIControlStateHighlighted];
        UIColor *bgColor = self.bgColorDict[key];
        if (bgColor) [self setBackgroundColor:bgColor];
    } else {
        if (!self.isSelected) {
            NSString *key = [self fetchBgColorKey: UIControlStateNormal];
            UIColor *bgColor = self.bgColorDict[key];
            if (bgColor) [self setBackgroundColor:bgColor];
        }
    }

}

- (void)ac_setEnabled:(BOOL)enabled {
    [self ac_setEnabled:enabled];
    NSString *key = [self fetchBgColorKey:(NO == enabled ? UIControlStateDisabled : UIControlStateNormal)];
    UIColor *bgColor = self.bgColorDict[key];
    if (bgColor) [self setBackgroundColor:bgColor];
    
}

- (NSMutableDictionary *)bgColorDict {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBgColorDict:(NSMutableDictionary *)bgColorDict {
    objc_setAssociatedObject(self, @selector(bgColorDict), bgColorDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)fetchBgColorKey:(UIControlState)state {
    NSString *key = kColorForNormal;
    switch (state) {
        case UIControlStateNormal:
            key = kColorForNormal;
            break;
        case UIControlStateHighlighted:
            key = kColorForHighlighted;
            break;
        case UIControlStateDisabled:
            key = kColorForDisabled;
            break;
        case UIControlStateSelected:
            key = kColorForSelected;
            break;
        case UIControlStateFocused:
            key = kColorForFocused;
            break;
        case UIControlStateReserved:
            key = kColorForReserved;
            break;
        case UIControlStateApplication:
            key = kColorForApplication;
            break;
        default:
            break;
    }
    return key;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end





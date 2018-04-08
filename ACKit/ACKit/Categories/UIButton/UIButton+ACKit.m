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

- (void)ac_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    
    if (!backgroundColor) return;
    
    if (!self.bgColorDict) self.bgColorDict = [NSMutableDictionary dictionary];
    
    NSString *key = [self fetchBgColorKey:state];
    self.bgColorDict[key] = backgroundColor;
    NSLog(@"%@",self.bgColorDict);
    if (state == UIControlStateNormal) {
        self.backgroundColor = backgroundColor;
    }
}

- (UIColor *)ac_backgroundColorForState:(UIControlState)state {
    NSString *key = [self fetchBgColorKey:state];
    return self.bgColorDict[key];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
//    NSString *key = [self fetchBgColorKey:(YES == selected ? UIControlStateSelected : UIControlStateNormal)];
//    UIColor *bgColor = self.bgColorDict[key];
//    [self setBackgroundColor:bgColor];
    NSLog(@"%s",__func__);
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    NSLog(@"%s",__func__);
//    NSString *key = [self fetchBgColorKey: (YES == highlighted ? UIControlStateHighlighted : UIControlStateNormal)];
//    UIColor *bgColor = self.bgColorDict[key];
//    [self setBackgroundColor:bgColor];
    
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    NSString *key = [self fetchBgColorKey:(NO == enabled ? UIControlStateDisabled : UIControlStateNormal)];
    UIColor *bgColor = self.bgColorDict[key];
    [self setBackgroundColor:bgColor];
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



//
//  UIButton+ACKit.h
//  ACKit
//
//  Created by ADDICE on 2018/4/8.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ACKit)

- (void)ac_setBackgroundColor:(nullable UIColor *)backgroundColor forState:(UIControlState)state; // default is nil

- (UIColor * _Nullable)ac_backgroundColorForState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END

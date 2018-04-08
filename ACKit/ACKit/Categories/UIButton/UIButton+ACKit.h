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

/**
 设置对应的 UIControlState 的 背景色，目前只针对 selected 和 highlighted

 @param backgroundColor 所设置的background 可为nil
 @param state 对应的 UIControlState
 */
- (void)ac_setBackgroundColor:(nullable UIColor *)backgroundColor forState:(UIControlState)state; // default is nil

/**
 不同 UIControllState 的 背景色

 @param state 对应的 UIControlState
 @return 背景色，可为 nil
 */
- (UIColor * _Nullable)ac_backgroundColorForState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END

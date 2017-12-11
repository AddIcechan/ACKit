//
//  UIViewController+ACKit.h
//  ACKit
//
//  Created by ADDICE on 2017/12/11.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - default setting
/**
 默认的导航栏背景色。如需设置默认的导航栏颜色。可更改以下方法。
 
 @return UIColor
 */
static inline UIColor * ac_defaultNavBarBackgourndColor() { return [UIColor whiteColor]; }

/**
 默认的导航栏title颜色。如需设置默认的导航栏title颜色。可更改以下方法。
 
 @return UIColor
 */
static inline UIColor * ac_defaultNavBarTextColor() { return [UIColor blackColor]; }

#pragma mark - UIViewController (ACKit)
@interface UIViewController (ACKit)

/**
 导航栏背景颜色。默认颜色是白色。
 实现
 [self.navigationController.navigationBar setBarTintColor:self.ac_navBarBackgroundColor];
 */
@property (nonatomic, strong) UIColor *ac_navBarBackgroundColor;

/**
 导航栏背景图片。默认为 nil。
 实现
 if (self.ac_navBarBackgroundImage) {
 [self.navigationController.navigationBar setBackgroundImage:self.ac_navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
 }
 */
@property (nonatomic, strong, nullable) UIImage *ac_navBarBackgroundImage;

/**
 导航栏字体颜色。默认为黑色。
 实现
 [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: self.ac_navBarTextColor}];
 */
@property (nonatomic, strong) UIColor *ac_navBarTextColor;

/**
 status bar 的颜色。默认为 default。
 UIStatusBarStyleDefault: 黑色
 UIStatusBarStyleLightContent: 白色
 实现
 [[UIApplication sharedApplication] setStatusBarStyle:self.newStatusBarStyle];
 */
@property (nonatomic, assign) UIStatusBarStyle ac_newStatusBarStyle;

/**
 导航栏 隐藏 显示。默认为 NO
 实现
 [self.navigationController setNavigationBarHidden:self.ac_navgationBarHidden animated:YES];
 */
@property (nonatomic, assign) BOOL ac_navgationBarHidden;

@end
NS_ASSUME_NONNULL_END

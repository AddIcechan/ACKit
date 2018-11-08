//
//  UIView+ACKit.h
//  ACKit
//
//  Created by ADDICE on 2017/12/20.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIView (AC_FrameExtention)

@property (nonatomic, assign) CGPoint ac_origin;
@property (nonatomic, assign) CGFloat ac_top;
@property (nonatomic, assign) CGFloat ac_bottom;
@property (nonatomic, assign) CGFloat ac_left;
@property (nonatomic, assign) CGFloat ac_right;

@property (nonatomic, assign) CGSize ac_size;
@property (nonatomic, assign) CGFloat ac_width;
@property (nonatomic, assign) CGFloat ac_height;

@end




NS_ASSUME_NONNULL_END

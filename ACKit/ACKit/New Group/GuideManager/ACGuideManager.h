//
//  ACGuideManager.h
//  ACKit
//
//  Created by ADDICE on 2018/3/23.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ACGuideHandler)(NSInteger index);

@interface ACGuideManager : NSObject

/**
 可以加多层引导层。。适合于点击第一个引导层 👉任意地方👈 后，再出现第二个引导层
 
 @param view 所要加的引导层的父 view
 @param completionHandler 一个很肥很肥的肥调处理。。就是点击一个引导层后的肥调
 @param guideView 引导层s。。这里用了 c 的可变参数 ，所以可以依次导入相应的引导层
 @return 所有 guideView 加的容器 view
 */
+ (UIView * _Nullable)addGuideInView:(UIView *)view
     completionHandler:(ACGuideHandler)completionHandler
             guideView:(UIView *)guideView,... NS_REQUIRES_NIL_TERMINATION;

/**
 添加引导层，并且有特定的按钮点击进行关闭
 
 @param view 所要加的引导层的父 view
 @param guideView 引导层的 view
 @param specialDismissBtn 特定的按钮, 按钮必须位于 guideView 里面
 @param completionHandler 一个很肥很肥的肥调处理。。就是点击特定按钮后的肥调, 可为 nil
 @return guideView 加的容器 view
 */
+ (UIView *)addGuideInView:(UIView *)view
             withGuideView:(UIView *)guideView
      andSpecialDismissBtn:(UIButton *)specialDismissBtn
         completionHandler:(ACGuideHandler _Nullable)completionHandler;

@end

NS_ASSUME_NONNULL_END

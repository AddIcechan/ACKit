//
//  ACGuideManager.m
//  ACKit
//
//  Created by ADDICE on 2018/3/23.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import "ACGuideManager.h"

NSInteger const singleGuideTag = 200000;

static ACGuideManager * manager;

@interface ACGuideManager()

@property (nonatomic, strong) ACGuideHandler completionHandler;
@property (nonatomic, assign) NSInteger currentGuideViewTag;

@end

@implementation ACGuideManager

#pragma mark - type for multi guide view with touch anywhere to dismiss

+ (UIView *)addGuideInView:(UIView *)view completionHandler:(ACGuideHandler)completionHandler guideView:(UIView *)guideView, ... {
    
    if (!guideView) return nil;
    
    manager = [[ACGuideManager alloc] init];
    
    manager.completionHandler = completionHandler;
    manager.currentGuideViewTag = singleGuideTag;
    
    UIView *bgView = [[UIView alloc] initWithFrame:view.bounds];
    //    bgView.backgroundColor = [UIColor cdBlackColorWithAlpha:0.6];
    [view addSubview:bgView];
    
    NSInteger guideViewTag = 0;
    
    va_list values;
    // values 会从 value 的指针地址开始取值，直至nil
    va_start(values, guideView);
    
    guideView.tag = singleGuideTag + guideViewTag;
    [bgView addSubview:guideView];
    
    UIView *tempValue;
    while((tempValue = va_arg(values, UIView *))) {
        
        guideViewTag += 1;
        tempValue.tag = singleGuideTag + guideViewTag;
        tempValue.alpha = 0;
        [bgView addSubview:tempValue];
    }
    
    // 记得清空
    va_end(values);
    
    UIButton *guideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    guideBtn.frame = view.bounds;
    [guideBtn addTarget:manager action:@selector(dismissMultGuideBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    guideBtn.backgroundColor = [UIColor clearColor];
    [bgView addSubview:guideBtn];
    
    return bgView;
    
}

- (void)dismissMultGuideBtnPressed:(UIButton *)sender {
    
    UIView *parentView = sender.superview;
    
    UIView *guideView = [parentView viewWithTag:self.currentGuideViewTag];
    
    UIView *nextGuideView = [parentView viewWithTag:self.currentGuideViewTag + 1];
    
    [UIView animateWithDuration:0.3 animations:^{
        guideView.alpha = 0;
    } completion:^(BOOL finished) {
        
        self.completionHandler(self.currentGuideViewTag - singleGuideTag);
        
        [guideView removeFromSuperview];
        
        self.currentGuideViewTag += 1;
        
        if (nextGuideView) {
            // 出现下一个引导层咯
            nextGuideView.alpha = 1;
        } else {
            // 没有多余的引导层。那么需要直接把 最上层的按钮 以及 底层view 移除
            [parentView removeFromSuperview];
        }
    }];
    
}

#pragma mark - type for special dismiss button

+ (UIView *)addGuideInView:(UIView *)view
             withGuideView:(UIView *)guideView
      andSpecialDismissBtn:(UIButton *)specialDismissBtn
         completionHandler:(ACGuideHandler _Nullable)completionHandler {
    
    if (!guideView) return nil;
    
    if (!specialDismissBtn) return nil;
    
    if (![guideView.subviews containsObject:specialDismissBtn]) {
        NSAssert([guideView.subviews containsObject:specialDismissBtn], @"specialDismissBtn doesn't in guide view");
        return nil;
    }
    
    manager = [[ACGuideManager alloc] init];
    
    manager.completionHandler = completionHandler;
    manager.currentGuideViewTag = singleGuideTag;
    
    UIView *bgView = [[UIView alloc] initWithFrame:view.bounds];
    
    [view addSubview:bgView];
    
    [bgView addSubview:guideView];
    
    [specialDismissBtn addTarget:manager action:@selector(specialDismissBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return bgView;
}

- (void)specialDismissBtnPressed:(UIButton *)sender {
    
    UIView *guideView = sender.superview;
    
    UIView *bgView = guideView.superview;
    
    [UIView animateWithDuration:0.3 animations:^{
        guideView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [bgView removeFromSuperview];
        
        !self.completionHandler ?: self.completionHandler(0);
        
    }];
    
    
}

@end

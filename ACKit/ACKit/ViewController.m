//
//  ViewController.m
//  ACKit
//
//  Created by ADDICE on 2017/12/11.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import "ViewController.h"
#import "ACKit.h"
#import "TestManager.h"

#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 80, 40, 40)];
    view1.backgroundColor = [UIColor yellowColor];
//    [view1 ac_cornerWithRadius:20];
    [self.view addSubview:view1];
    
    UIScreen.mainScreen.bounds.size.height;
    
    [TestManager.sharedInstance test2];
    [TestManager.sharedInstance test1];
    
    TestManager.name = @"test";
    NSLog(@"%@", TestManager.name);
    
    TestManager.name = @"test again";
    NSLog(@"%@", TestManager.name);
    
    UIButton *btn = [UIButton buttonWithTouchAnimateType:AC_TouchAnimateZoom];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:btn];
    
    
}

- (void)testBtnPressed:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

@end

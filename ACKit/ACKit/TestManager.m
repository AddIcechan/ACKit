//
//  TestManager.m
//  ACKit
//
//  Created by ADDICE on 2018/4/14.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import "TestManager.h"

static TestManager *_shareInstance = nil;

static NSString *_name = nil;

@implementation TestManager

+ (TestManager *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[TestManager alloc] init];
    });
    return _shareInstance;
}

+ (NSString *)name {
    return _name;
}

+ (void)setName:(NSString *)name {
    _name = name;
}

- (void)test1 {
    NSLog(@"test1");
}

- (void)test2 {
    NSLog(@"test2");
}

//- (instancetype)sharedInstance {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _shareInstance = [[TestManager alloc] init];
//    });
//    return _shareInstance;
//}
//
//
//- (NSArray *)testArr {
//
//}


@end

//
//  NSArray+ACKit.m
//  ACKit
//
//  Created by ADDICE on 2018/4/3.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import "NSArray+ACKit.h"

@implementation NSArray (ACKit)

- (NSArray *)ac_mapUsingBlock:(id  _Nonnull (^)(id _Nonnull, NSUInteger))block {
    NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [resultArr addObject:block(obj, idx)];
    }];
    
    return resultArr;
}

@end

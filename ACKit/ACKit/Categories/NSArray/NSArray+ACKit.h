//
//  NSArray+ACKit.h
//  ACKit
//
//  Created by ADDICE on 2018/4/3.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant ObjectType> (ACKit)

- (NSArray *)ac_mapUsingBlock:(id (^)(ObjectType obj, NSUInteger idx))block;

@end

NS_ASSUME_NONNULL_END

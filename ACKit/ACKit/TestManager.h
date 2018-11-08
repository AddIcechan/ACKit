//
//  TestManager.h
//  ACKit
//
//  Created by ADDICE on 2018/4/14.
//  Copyright © 2018年 ADDICE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestManager : NSObject

@property (class, nonatomic, readonly) TestManager *sharedInstance;

@property (class, nonatomic, strong) NSString *name;

//+ (TestManager *)sharedInstance;

//+ (instancetype)sharedInstance;

- (void)test1;

- (void)test2;

@end

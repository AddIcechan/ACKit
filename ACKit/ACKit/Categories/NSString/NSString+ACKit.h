//
//  NSString+Extension.h
//  ACKit
//
//  Created by ADDICE on 2017/12/18.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSString (AC_SubStringExtension)

- (NSString *)ac_substringToIndex:(NSUInteger)to;

- (NSString *)ac_substringFromIndex:(NSUInteger)from;

- (NSString *)ac_substringWithRange:(NSRange)range;

@end
NS_ASSUME_NONNULL_END

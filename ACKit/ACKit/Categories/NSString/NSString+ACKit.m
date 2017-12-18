//
//  NSString+Extension.m
//  ACKit
//
//  Created by ADDICE on 2017/12/18.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

#import "NSString+ACKit.h"

@implementation NSString (AC_SubStringExtension)

- (NSString *)ac_substringToIndex:(NSUInteger)to {
    if (to > self.length) return self;
    
    return [self substringFromIndex:to];
}

- (NSString *)ac_substringFromIndex:(NSUInteger)from {
    if (from > self.length) return self;
    
    return [self substringFromIndex:from];
}

- (NSString *)ac_substringWithRange:(NSRange)range {
    if ((range.location + range.length) > self.length) return self;
    
    return [self substringWithRange:range];
}

@end

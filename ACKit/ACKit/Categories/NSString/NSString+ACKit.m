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

@implementation NSString (AC_SizeExtension)

- (CGSize)ac_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize  {
    if (!font)  return CGSizeZero;
    
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName: font}
                              context:nil].size;
}

@end

@implementation NSString (AC_AttributedString)

- (NSMutableAttributedString *)ac_toAttribuedString {
    
    return [[NSMutableAttributedString alloc] initWithString:self];
    
}

@end

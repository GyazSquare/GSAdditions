//
//  NSStringGSAdditions.m
//  FoundationGSAdditions
//

@import Foundation;

#import "NSStringGSAdditions.h"

@implementation NSString (GSAdditions)

- (BOOL)gs_isEqualToStringCaseInsensitive:(nullable NSString *)aString {
    return (aString && [self compare:aString options:(NSCaseInsensitiveSearch | NSLiteralSearch)] == NSOrderedSame);
}

- (BOOL)gs_hasPrefixCaseInsensitive:(nullable NSString *)aString {
    return (aString && ([self rangeOfString:aString options:(NSCaseInsensitiveSearch | NSAnchoredSearch)].length > 0));
}

- (BOOL)gs_hasSuffixCaseInsensitive:(nullable NSString *)aString {
    return (aString && ([self rangeOfString:aString options:(NSCaseInsensitiveSearch | NSBackwardsSearch | NSAnchoredSearch)].length > 0));
}

#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <=  __IPHONE_OS_VERSION_MAX_ALLOWED
- (CGFloat)gs_cgFloatValue {
    if (sizeof(CGFloat) > sizeof(float)) {
        return [self doubleValue];
    } else {
        return [self floatValue];
    }
}
#endif

@end

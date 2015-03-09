//
//  NSValueGSAdditions.m
//  FoundationGSAdditions
//

@import Foundation;

#import "NSValueGSAdditions.h"

@implementation NSNumber (GSAdditions)

#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <=  __IPHONE_OS_VERSION_MAX_ALLOWED
- (CGFloat)gs_CGFloatValue {
#if defined(__LP64__) && __LP64__
    return self.doubleValue;
#else
    return self.floatValue;
#endif
}

+ (NSNumber *)gs_numberWithCGFloat:(CGFloat)value {
    return (__bridge_transfer NSNumber *)CFNumberCreate(kCFAllocatorDefault, kCFNumberCGFloatType, &value);
}
#endif

@end

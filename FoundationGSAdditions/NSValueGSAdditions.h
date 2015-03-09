//
//  NSValueGSAdditions.h
//  FoundationGSAdditions
//

@import Foundation.NSValue;
#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <=  __IPHONE_OS_VERSION_MAX_ALLOWED
#if !defined(TARGET_OS_IPHONE) || !TARGET_OS_IPHONE
@import Foundation.NSGeometry;
#else
#import <CoreGraphics/CGBase.h>
#endif
#endif

@interface NSNumber (GSAdditions)

#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <=  __IPHONE_OS_VERSION_MAX_ALLOWED
@property (readonly) CGFloat gs_CGFloatValue;
+ (NSNumber *)gs_numberWithCGFloat:(CGFloat)value;
#endif

@end
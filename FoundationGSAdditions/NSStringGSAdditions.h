//
//  NSStringGSAdditions.h
//  FoundationGSAdditions
//

@import Foundation.NSString;
#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <=  __IPHONE_OS_VERSION_MAX_ALLOWED
#if !defined(TARGET_OS_IPHONE) || !TARGET_OS_IPHONE
@import Foundation.NSGeometry;
#else
#import <CoreGraphics/CGBase.h>
#endif
#endif

@interface NSString (GSAdditions)

- (BOOL)gs_isEqualToStringCaseInsensitive:(NSString *)aString;
- (BOOL)gs_hasPrefixCaseInsensitive:(NSString *)aString;
- (BOOL)gs_hasSuffixCaseInsensitive:(NSString *)aString;
#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <=  __IPHONE_OS_VERSION_MAX_ALLOWED
- (CGFloat)gs_cgFloatValue;
#endif

@end

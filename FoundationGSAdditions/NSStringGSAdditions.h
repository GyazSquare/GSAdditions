//
//  NSStringGSAdditions.h
//  FoundationGSAdditions
//

@import Foundation.NSString;
#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED || __WATCHOS_2_0 <= __WATCH_OS_VERSION_MAX_ALLOWED
#if !defined(TARGET_OS_IPHONE) || !TARGET_OS_IPHONE
@import Foundation.NSGeometry;
#else
#import <CoreGraphics/CGBase.h>
#endif
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GSAdditions)

- (BOOL)gs_isEqualToStringCaseInsensitive:(nullable NSString *)aString;
- (BOOL)gs_hasPrefixCaseInsensitive:(nullable NSString *)aString;
- (BOOL)gs_hasSuffixCaseInsensitive:(nullable NSString *)aString;
#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED || __WATCHOS_2_0 <= __WATCH_OS_VERSION_MAX_ALLOWED
- (CGFloat)gs_cgFloatValue;
#endif

@end

NS_ASSUME_NONNULL_END

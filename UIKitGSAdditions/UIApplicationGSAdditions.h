//
//  UIApplicationGSAdditions.h
//  UIKitGSAdditions
//

@import UIKit.UIApplication;

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (GSAdditions)

- (void)gs_enableIdleTimer;
- (void)gs_disableIdleTimer;

- (void)gs_enableNetworkActivityIndicator;
- (void)gs_disableNetworkActivityIndicator;

- (void)gs_clearAllNotifications;

@end

NS_ASSUME_NONNULL_END

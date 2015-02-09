//
//  UIApplicationGSAdditions.m
//  UIKitGSAdditions
//

#import "UIApplicationGSAdditions.h"

@implementation UIApplication (GSAdditions)

static NSUInteger sEnableIdleTimerCount = 1; // default is 'enabled'

- (void)gs_enableIdleTimer {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    sEnableIdleTimerCount++;
    if (sEnableIdleTimerCount == 1) {
        self.idleTimerDisabled = NO;
    }
}

- (void)gs_disableIdleTimer {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    NSAssert1(sEnableIdleTimerCount > 0, @"*** %s: sEnableIdleTimerCount is 0", __PRETTY_FUNCTION__);
    sEnableIdleTimerCount--;
    if (sEnableIdleTimerCount == 0) {
        self.idleTimerDisabled = YES;
    }
}

static NSUInteger sEnableNetworkActivityIndicatorCount = 0;

- (void)gs_enableNetworkActivityIndicator {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    sEnableNetworkActivityIndicatorCount++;
    if (sEnableNetworkActivityIndicatorCount == 1) {
        self.networkActivityIndicatorVisible = YES;
    }
}

- (void)gs_disableNetworkActivityIndicator {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    NSAssert1(sEnableNetworkActivityIndicatorCount > 0, @"*** %s: sEnableNetworkActivityIndicatorCount is 0", __PRETTY_FUNCTION__);
    sEnableNetworkActivityIndicatorCount--;
    if (sEnableNetworkActivityIndicatorCount == 0) {
        self.networkActivityIndicatorVisible = NO;
    }
}

- (void)gs_clearAllNotifications {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    self.applicationIconBadgeNumber = 1;
    self.applicationIconBadgeNumber = 0;
}

@end

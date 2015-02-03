//
//  UIApplicationGSAdditions.m
//  UIKitGSAdditions
//

#import "UIApplicationGSAdditions.h"

@implementation UIApplication (GSAdditions)

static NSUInteger sShowNetworkActivityIndicatorCount = 0;

- (void)gs_enableNetworkActivityIndicator {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    sShowNetworkActivityIndicatorCount++;
    if (sShowNetworkActivityIndicatorCount == 1) {
        self.networkActivityIndicatorVisible = YES;
    }
}

- (void)gs_disableNetworkActivityIndicator {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    NSAssert1(sShowNetworkActivityIndicatorCount > 0, @"*** %s: sShowNetworkActivityIndicatorCount is 0", __PRETTY_FUNCTION__);
    sShowNetworkActivityIndicatorCount--;
    if (sShowNetworkActivityIndicatorCount == 0) {
        self.networkActivityIndicatorVisible = NO;
    }
}

- (void)gs_clearAllNotifications {
    NSAssert1([NSThread isMainThread], @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    self.applicationIconBadgeNumber = 1;
    self.applicationIconBadgeNumber = 0;
}

@end

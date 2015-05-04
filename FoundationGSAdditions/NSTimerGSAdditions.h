//
//  NSTimerGSAdditions.h
//  FoundationGSAdditions
//

@import Foundation.NSTimer;

#import "NSObjCRuntimeGSAdditions.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (GSAdditions)

+ (NSTimer *)gs_timerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo;
+ (NSTimer *)gs_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END

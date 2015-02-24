//
//  NSTimerGSAdditions.h
//  FoundationGSAdditions
//

@import Foundation.NSTimer;

@interface NSTimer (GSAdditions)

+ (NSTimer *)gs_timerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo;
+ (NSTimer *)gs_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo;

@end

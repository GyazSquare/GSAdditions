//
//  NSTimerGSAdditions.m
//  FoundationGSAdditions
//

@import Foundation;

#import "NSTimerGSAdditions.h"

@implementation NSTimer (GSAdditions)

+ (void)gs_invokeBlock:(NSTimer *)timer {
    void (^block)(NSTimer *) = timer.userInfo;
    block(timer);
}

+ (NSTimer *)gs_timerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo {
    return [NSTimer timerWithTimeInterval:ti target:self selector:@selector(gs_invokeBlock:) userInfo:block repeats:yesOrNo];
}

+ (NSTimer *)gs_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo {
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(gs_invokeBlock:) userInfo:block  repeats:yesOrNo];
}

@end

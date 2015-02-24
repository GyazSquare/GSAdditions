//
//  NSTimerGSAdditionsTests.m
//  GSAdditions
//

@import Foundation;
@import XCTest;

#import "NSTimerGSAdditions.h"

@interface NSTimerGSAdditionsTests : XCTestCase
@end

@implementation NSTimerGSAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_gs_timerWithTimeInterval {
    __block BOOL tick = NO;
    NSTimer *timer = [NSTimer gs_timerWithTimeInterval:1 block:^(NSTimer *timer) {
        tick = YES;
    } repeats:NO];
    [timer fire];
    while (!tick) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
    __block NSInteger tickCount = 0;
    timer = [NSTimer gs_timerWithTimeInterval:1 block:^(NSTimer *timer) {
        ++tickCount;
    } repeats:YES];
    [timer fire];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    while (tickCount < 3) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
}

- (void)test_gs_scheduledTimerWithTimeInterval {
    __block BOOL tick = NO;
    NSTimer *timer = [NSTimer gs_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
        tick = YES;
    } repeats:NO];
    while (!tick) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
    __block NSInteger tickCount = 0;
    timer = [NSTimer gs_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
        ++tickCount;
    } repeats:YES];
    while (tickCount < 3) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
}

@end

//
//  NSValueGSAdditionsTests.m
//  GSAdditions
//

@import Foundation;
@import XCTest;

#import "NSValueGSAdditions.h"

@interface NSValueGSAdditionsTests : XCTestCase
@end

@implementation NSValueGSAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_gs_CGFloatValue {
    {
        NSNumber *number = @3.14f; // float
        XCTAssertEqual(sizeof(CGFloat), sizeof(number.gs_CGFloatValue));
    }
    {
        NSNumber *number = @3.1415926535; // double
        XCTAssertEqual(sizeof(CGFloat), sizeof(number.gs_CGFloatValue));
    }
}

- (void)test_gs_numberWithCGFloat {
    {
        CGFloat value = 3.14f;
        XCTAssertEqualObjects(@(value), [NSNumber gs_numberWithCGFloat:value]);
    }
    {
        CGFloat value = 3.1415926535;
        XCTAssertEqualObjects(@(value), [NSNumber gs_numberWithCGFloat:value]);
    }
}

@end

//
//  NSDataGSAdditionsTests.m
//  GSAdditions
//

@import Foundation;
@import XCTest;

#import "NSDataGSAdditions.h"

@interface NSDataGSAdditionsTests : XCTestCase
@end

@implementation NSDataGSAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHexString {
    // empty data
    {
        NSData *data = [NSData data];
        XCTAssertEqualObjects(@"", [data gs_hexString]);
    }
    // text
    {
        NSData *data = [@"The quick brown fox jumps over the lazy dog" dataUsingEncoding:NSUTF8StringEncoding];
        XCTAssertEqualObjects(@"54686520717569636b2062726f776e20666f78206a756d7073206f76657220746865206c617a7920646f67", [data gs_hexString]);
    }
}

@end

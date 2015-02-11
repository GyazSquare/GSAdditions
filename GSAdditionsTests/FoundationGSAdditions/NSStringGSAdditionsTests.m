//
//  NSStringGSAdditionsTests.m
//  GSAdditions
//

@import Foundation;
@import XCTest;

#import "NSStringGSAdditions.h"

@interface NSStringGSAdditionsTests : XCTestCase
@end

@implementation NSStringGSAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_gs_isEqualToStringCaseInsensitive {
    // nil
    XCTAssertFalse([@"A" gs_isEqualToStringCaseInsensitive:nil]);
    // A
    XCTAssertTrue([@"A" gs_isEqualToStringCaseInsensitive:@"A"]);
    XCTAssertTrue([@"A" gs_isEqualToStringCaseInsensitive:@"a"]);
    XCTAssertFalse([@"A" gs_isEqualToStringCaseInsensitive:@"B"]);
    XCTAssertFalse([@"A" gs_isEqualToStringCaseInsensitive:@"b"]);
    // Ä
    XCTAssertTrue([@"Ä" gs_isEqualToStringCaseInsensitive:@"Ä"]);
    XCTAssertTrue([@"Ä" gs_isEqualToStringCaseInsensitive:@"ä"]);
    // A + umlaut
    NSString *A = [NSString stringWithUTF8String:"\x41\xCC\x88"];
    XCTAssertEqual([A caseInsensitiveCompare:@"Ä"], NSOrderedSame);
    XCTAssertFalse([A gs_isEqualToStringCaseInsensitive:@"Ä"]);
}

- (void)test_gs_hasPrefixCaseInsensitive {
    // nil
    XCTAssertFalse([@"AB" gs_hasPrefixCaseInsensitive:nil]);
    // empty
    XCTAssertFalse([@"AB" gs_hasPrefixCaseInsensitive:@""]);
    // length
    XCTAssertFalse([@"AB" gs_hasPrefixCaseInsensitive:@"ABC"]);
    // AB
    XCTAssertTrue([@"AB" gs_hasPrefixCaseInsensitive:@"A"]);
    XCTAssertTrue([@"AB" gs_hasPrefixCaseInsensitive:@"a"]);
    XCTAssertFalse([@"AB" gs_hasPrefixCaseInsensitive:@"B"]);
    XCTAssertFalse([@"AB" gs_hasPrefixCaseInsensitive:@"b"]);
    // ÄB
    XCTAssertTrue([@"ÄB" gs_hasPrefixCaseInsensitive:@"Ä"]);
    XCTAssertTrue([@"ÄB" gs_hasPrefixCaseInsensitive:@"ä"]);
    // A + umlaut + B
    NSString *AB = [NSString stringWithUTF8String:"\x41\xCC\x88\x42"];
    XCTAssertTrue([AB gs_hasPrefixCaseInsensitive:@"Ä"]);
    // Fix on Rev.79
    NSString *A = [NSString stringWithUTF8String:"\x41\xCC\x88"];
    XCTAssertTrue([@"Ä" gs_hasPrefixCaseInsensitive:A]);
}

- (void)test_gs_hasSuffixCaseInsensitive {
    // nil
    XCTAssertFalse([@"BA" gs_hasSuffixCaseInsensitive:nil]);
    // empty
    XCTAssertFalse([@"BA" gs_hasSuffixCaseInsensitive:@""]);
    // length
    XCTAssertFalse([@"BA" gs_hasSuffixCaseInsensitive:@"CBA"]);
    // BA
    XCTAssertTrue([@"BA" gs_hasSuffixCaseInsensitive:@"A"]);
    XCTAssertTrue([@"BA" gs_hasSuffixCaseInsensitive:@"a"]);
    XCTAssertFalse([@"BA" gs_hasSuffixCaseInsensitive:@"B"]);
    XCTAssertFalse([@"BA" gs_hasSuffixCaseInsensitive:@"b"]);
    // BÄ
    XCTAssertTrue([@"BÄ" gs_hasSuffixCaseInsensitive:@"Ä"]);
    XCTAssertTrue([@"BÄ" gs_hasSuffixCaseInsensitive:@"ä"]);
    // B + A + umlaut
    NSString *BA = [NSString stringWithUTF8String:"\x42\x41\xCC\x88"];
    XCTAssertTrue([BA gs_hasSuffixCaseInsensitive:@"Ä"]);
    // Fix on Rev.79
    NSString *A = [NSString stringWithUTF8String:"\x41\xCC\x88"];
    XCTAssertTrue([@"Ä" gs_hasPrefixCaseInsensitive:A]);
}

#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <=  __IPHONE_OS_VERSION_MAX_ALLOWED
- (void)test_gs_cgFloatValue {
    if (sizeof(CGFloat) > sizeof(float)) {
        // overflow
        NSString *max = @"1.8e+308";
        XCTAssertEqual((double)[max gs_cgFloatValue], HUGE_VAL);
        // underflow
        NSString *min = @"-1.8e+308";
        XCTAssertEqual((double)[min gs_cgFloatValue], -HUGE_VAL);
        // invalid
        XCTAssertEqual((double)[@"a1.0" gs_cgFloatValue], 0.0);
        // 1.0
        XCTAssertEqual((double)[@"1.0" gs_cgFloatValue], 1.0);
        XCTAssertEqual((double)[@"1.0a" gs_cgFloatValue], 1.0);
    } else {
        // overflow
        NSString *max = @"3.5e+38";
        XCTAssertEqual((double)[max gs_cgFloatValue], HUGE_VAL);
        // underflow
        NSString *min = @"-3.5e+38";
        XCTAssertEqual((double)[min gs_cgFloatValue], -HUGE_VAL);
        // invalid
        XCTAssertEqual((double)[@"a1.0" gs_cgFloatValue], 0.0);
        // 1.0
        XCTAssertEqual((double)[@"1.0" gs_cgFloatValue], 1.0);
        XCTAssertEqual((double)[@"1.0a" gs_cgFloatValue], 1.0);
    }
}
#endif


@end

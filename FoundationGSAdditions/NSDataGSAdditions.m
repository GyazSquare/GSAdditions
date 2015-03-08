//
//  NSDataGSAdditions.m
//  FoundationGSAdditions
//

@import Foundation;

#import "NSDataGSAdditions.h"

@implementation NSData (GSAdditions)

- (NSString *)gs_hexString {
    const unsigned char *bytes = self.bytes;
    NSUInteger length = self.length;
    NSMutableString *string = [NSMutableString stringWithCapacity:(length * 2)];
    for (NSUInteger i = 0; i < length; i++) {
        [string appendFormat:@"%02x", (unsigned)bytes[i]];
    }
    return string;
}

@end

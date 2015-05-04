//
//  NSDataGSAdditions.h
//  FoundationGSAdditions
//

@import Foundation.NSData;

#import "NSObjCRuntimeGSAdditions.h"

@class NSString;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (GSAdditions)

- (NSString *)gs_hexString;

@end

NS_ASSUME_NONNULL_END

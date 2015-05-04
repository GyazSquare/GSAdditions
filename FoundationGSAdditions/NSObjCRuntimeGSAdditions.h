//
//  NSObjCRuntimeGSAdditions.h
//  FoundationGSAdditions
//

@import Foundation.NSObjCRuntime;

#ifndef __has_feature
#define __has_feature(x) 0
#endif

#if !__has_feature(nullability)
#define __nonnull
#define __nullable
#define __null_unspecified
#define nonnull
#define nullable
#define null_unspecified
#define null_resettable
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#endif

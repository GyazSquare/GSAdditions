//
//  UITableViewCellGSAdditions.m
//  UIKitGSAdditions
//

@import ObjectiveC;
@import UIKit;

#import "UITableViewCellGSAdditions.h"

@implementation UITableViewCell (GSAdditions)

+ (void)load {
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    if([systemVersion compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending) {
        // iOS 9 or later
        // do nothing
    } else if ([systemVersion compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending) {
        // iOS 8.x
        // Subtitles of UITableViewCell won't update
        // http://stackoverflow.com/questions/25793074/subtitles-of-uitableviewcell-wont-update
        Method original = class_getInstanceMethod(self, @selector(layoutSubviews));
        Method replace = class_getInstanceMethod(self, @selector(gs_layoutSubviews));
        method_exchangeImplementations(original, replace);
    } else {
        // iOS 7.x or earlier
        // do nothing
    }
}

#pragma mark - Class extensions

- (void)gs_layoutSubviews {
    UILabel *detailTextLabel = self.detailTextLabel;
    if (detailTextLabel && !detailTextLabel.superview) {
        [self.contentView addSubview:detailTextLabel];
    }
    [self gs_layoutSubviews];
}

@end

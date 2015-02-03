//
//  UITableViewCellGSAdditions.m
//  UIKitGSAdditions
//

@import ObjectiveC;
@import UIKit;

#import "UITableViewCellGSAdditions.h"

@implementation UITableViewCell (GSAdditions)

+ (void)load {
    // TODO: Subtitles of UITableViewCell won't update
    // http://stackoverflow.com/questions/25793074/subtitles-of-uitableviewcell-wont-update
    if ([[UIDevice currentDevice].systemVersion compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending) {
        // iOS 8 or later
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

//
// This file is part of NibLoader
//
// Created by JC on 9/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

#import "NBLContainerView.h"

@implementation NBLContainerView

- (void)setContentView:(UIView *)contentView {
    NSDictionary *viewsDictionary = contentView ? NSDictionaryOfVariableBindings(contentView) : nil;

    if (contentView == _contentView)
        return;
    
    [_contentView removeFromSuperview]; // The previous contentView is no more part of the container
    
    _contentView = contentView;
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (_contentView) {
        [self addSubview:_contentView];

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:viewsDictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:0 views:viewsDictionary]];
    }
}

- (void)addSubview:(UIView *)view {
    if (view.superview == self)
        return;
    
    if (self.contentView != view) {
        self.contentView = view;
        return;
    }
    
    // Seem to be an issue on iOS6 so we manually remove view from superview
    // https://github.com/gslomin/UIView-NibLoading/commit/17a794725bee2921dc27c5685398535076d381c7
    [view removeFromSuperview];
    [super addSubview:view];
}

@end

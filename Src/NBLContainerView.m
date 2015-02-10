//
// This file is part of NibLoader
//
// Created by JC on 9/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

#import "NBLContainerView.h"
#import "UIView+NibLoader.h"

@interface NBLContainerView ()
@property(nonatomic, strong)IBInspectable NSString    *contentNib;
@end

@implementation NBLContainerView

- (void)setContentNib:(NSString *)contentNib {
    if (contentNib == _contentNib) {
        _contentNib = contentNib;
        self.contentView = [[UINib nibWithNibName:contentNib bundle:nil] instantiateWithOwner:nil options:nil][0];
    }
}

- (void)setContentView:(UIView *)contentView {
    NSDictionary *viewsDictionary = contentView ? NSDictionaryOfVariableBindings(contentView) : nil;

    if (contentView == _contentView)
        return;
    
    [_contentView removeFromSuperview]; // The previous contentView is no more part of the container

    _contentView = contentView;
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (_contentView) {
        // Seem to be an issue on iOS6 so we manually remove view from superview
        // https://github.com/gslomin/UIView-NibLoading/commit/17a794725bee2921dc27c5685398535076d381c7
        [_contentView removeFromSuperview];
        
        [super addSubview:_contentView];

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:viewsDictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:0 views:viewsDictionary]];
        
        [self invalidateIntrinsicContentSize];
        [self setNeedsUpdateConstraints];
    }
}

- (void)addSubview:(UIView *)view {
    [self setContentView:view];
}

- (CGSize)intrinsicContentSize {
    if (self.contentView) {
        CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        return CGSizeMake(size.width ?: UIViewNoIntrinsicMetric, size.height ?: UIViewNoIntrinsicMetric);
    }
    
    return [super intrinsicContentSize];
}

@end

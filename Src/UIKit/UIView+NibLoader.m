//
// This file is part of NibLoader
//
// Created by JC on 9/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

#import "UIView+NibLoader.h"

@implementation UIView (NibLoader)

+ (instancetype)viewFromNib {
    return [self viewFromNibNamed:NSStringFromClass([self class]) owner:self];
}

+ (instancetype)viewFromNibNamed:(NSString *)nibName owner:(id)owner {
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];

    return [self viewFromNib:nib owner:owner];
}

+ (instancetype)viewFromNib:(UINib *)nib owner:(id)owner {
    NSArray *rootViews = [nib instantiateWithOwner:owner options:nil];

    for (UIView *rootView in rootViews) {
        if ([rootViews isKindOfClass:[self class]])
            return rootView;
    }

    @throw [NSException exceptionWithName:@"ViewFromNibException"
                                   reason:[NSString stringWithFormat:@"nib does not contain any view of type %@", NSStringFromClass([self class])]
                                 userInfo:nil];

    return nil;
}

@end

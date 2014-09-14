//
// This file is part of NibLoader
//
// Created by JC on 9/14/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

#import "UIView+NibLoader.h"

SPEC_BEGIN(UIViewLoaderSpec)

describe(@"with UIView", ^{
    context(@"from UIView nib", ^{
        __block UINib *nib;
        
        beforeEach(^{
            nib = [UINib nibWithNibName:@"ContainerSizedTests" bundle:[NSBundle bundleForClass:self.class]];
        });
        
        it(@"should load", ^{
            [[theBlock(^{ [UIView viewFromNib:nib owner:nil]; }) shouldNot] raise];
        });
    });
    
    context(@"from nil", ^{
        it(@"should fail to load nib named UIView", ^{
            [[theBlock(^{ [UIView viewFromNib]; }) should] raise];
        });
    });
});

describe(@"with UITableView", ^{
    context(@"from UIView nib", ^{
        __block UINib *nib;
        
        beforeEach(^{
            nib = [UINib nibWithNibName:@"ContainerSizedTests" bundle:[NSBundle bundleForClass:self.class]];
        });
        
        it(@"should fail to find UITableView instance", ^{
            [[theBlock(^{ [UITableView viewFromNib:nib owner:nil]; }) should] raiseWithName:@"ViewFromNibException"];
        });
    });
});

SPEC_END
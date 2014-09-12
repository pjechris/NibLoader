//
// This file is part of NibLoader
//
// Created by JC on 9/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//


#import <Foundation/Foundation.h>
#import "NBLContainerView.h"
#import "UIView+NibLoader.h"

SPEC_BEGIN(NBLContainerViewTests)

__block UIView *contentView;
__block NBLContainerView *containerView;

describe(@"with no content", ^{
    beforeEach(^{
        contentView = [UIView new];
        containerView = [NBLContainerView new];
    });
    
    context(@"when setting content view", ^{
        it(@"should have view as contentView", ^{
            containerView.contentView = contentView;

            [[contentView.superview should] equal:containerView];
            [[containerView.contentView should] equal:contentView];
        });
        
        it(@"should remove contentView from superview", ^{
            [[contentView should] receive:@selector(removeFromSuperview)];
            
            containerView.contentView = contentView;
        });
    });
    
    context(@"when adding subview", ^{
        it(@"should have view as contentView", ^{
            [containerView addSubview:contentView];

            [[containerView.contentView should] equal:contentView];
        });
    });
});

describe(@"with content", ^{
    beforeEach(^{
        contentView = [UIView new];
        containerView = [NBLContainerView new];
        containerView.contentView = contentView;
    });
    
    context(@"when setting NEW content view", ^{
        __block UIView *newContentView;
        
        beforeEach(^{
            newContentView = [UIView new];
        });
        
        it(@"should have new view as content vieww", ^{
            containerView.contentView = newContentView;
            
            [[newContentView.superview should] equal:containerView];
            [[containerView.contentView should] equal:newContentView];
        });

        context(@"when setting SAME content view", ^{
            it(@"should not remove view", ^{
                [[contentView shouldNot] receive:@selector(removeFromSuperview)];

                containerView.contentView = contentView;

                [[contentView.superview should] equal:containerView];
            });
        });
    });
    
    context(@"when nullifying content view", ^{
        it(@"should remove content view", ^{
            containerView.contentView = nil;
            
            [[containerView.contentView should] beNil];
        });
        
        it(@"should remove contentView from superview", ^{
            [[contentView should] receive:@selector(removeFromSuperview)];
            
            containerView.contentView = nil;
        });
    });
    
    context(@"when adding subview", ^{
        __block UIView *newView;

        beforeEach(^{
            newView = [UIView new];
        });

        it(@"should replace content view", ^{
            [containerView addSubview:newView];

            [[containerView.contentView should] equal:newView];
        });

        context(@"when adding SAME content view", ^{
            it(@"should not remove view", ^{
                [[contentView shouldNot] receive:@selector(removeFromSuperview)];

                [containerView addSubview:contentView];

                [[containerView.contentView should] equal:contentView];
            });
        });
    });
    
    describe(@"auto-layout", ^{
        __block NSDictionary *bindings;

        beforeEach(^{
            bindings = NSDictionaryOfVariableBindings(containerView, contentView);
        });

        describe(@"when container has constraints", ^{
            __block UIView *rootView;

            beforeEach(^{
                rootView = [UIView viewFromNib:[UINib nibWithNibName:@"ViewTests" bundle:[NSBundle bundleForClass:self.class]] owner:nil];
                containerView = [rootView subviews][0];
                containerView.contentView = contentView;
            });

            context(@"contentView size", ^{
                it(@"should equal container size", ^{
                    [[theValue(CGRectGetWidth(contentView.frame)) shouldNot] equal:theValue(0)];
                    [[theValue(CGRectGetWidth(contentView.frame)) should] equal:theValue(CGRectGetWidth(containerView.frame))];
                });
            });

            context(@"intrinsicContentSize", ^{
                
            });
        });
    });
});

SPEC_END
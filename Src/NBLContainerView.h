//
// This file is part of NibLoader
//
// Created by JC on 9/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

#import <Foundation/Foundation.h>

/**
 * Container view which wrap another view inside itself. Use this container inside Xibs (or even Storyboards) to
 * dynamically load decoupled xib components
 *
 * ContainerView work only with AutoLayout allowing it to:
 * - adapt contained view to the container dimensions when container has size constraints
 * - adapt container when contained view has size constraints
 *
 * Despite the fact that it inherit from UIView ContainerView can have **ONLY 1 subview**: the contained view
 */
@interface NBLContainerView : UIView

@property(nonatomic, weak)UIView  *contentView;

@end

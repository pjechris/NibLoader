//
// This file is part of NibLoader
//
// Created by JC on 9/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

#import <Foundation/Foundation.h>

@interface UIView (NibLoader)

+ (instancetype)viewFromNib;

+ (instancetype)viewFromNibNamed:(NSString *)nibName owner:(id)owner;

+ (instancetype)viewFromNib:(UINib *)nib owner:(id)owner;


@end

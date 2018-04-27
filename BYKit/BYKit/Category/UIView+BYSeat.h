//
//  UIView+BYSeat.h
//  BYKit
//
//  Created by SunShine.Rock on 2018/4/20.
//  Copyright © 2018年 Berton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BYSeat)

@property (nonatomic) CGFloat byLeft;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat byTop;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat byRight;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat byBottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat byWidth;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat byHeight;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat byCenterX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat byCenterY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint byOrigin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  bySize;        ///< Shortcut for frame.size.

/// Get Relative Position From View
- (CGRect)getRelativePositionFromView:(UIView *)view;

@end

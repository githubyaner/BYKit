//
//  UIView+BYSeat.m
//  BYKit
//
//  Created by SunShine.Rock on 2018/4/20.
//  Copyright © 2018年 Berton. All rights reserved.
//

#import "UIView+BYSeat.h"

@implementation UIView (BYSeat)

/// left
- (CGFloat)byLeft {
    return self.frame.origin.x;
}

- (void)setByLeft:(CGFloat)byLeft {
    CGRect frame = self.frame;
    frame.origin.x = byLeft;
    self.frame = frame;
}

/// top
- (CGFloat)byTop {
    return self.frame.origin.y;
}

- (void)setByTop:(CGFloat)byTop {
    CGRect frame = self.frame;
    frame.origin.y = byTop;
    self.frame = frame;
}

/// right
- (CGFloat)byRight {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setByRight:(CGFloat)byRight {
    CGRect frame = self.frame;
    frame.origin.x = byRight - frame.size.width;
    self.frame = frame;
}

/// botoom
- (CGFloat)byBottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setByBottom:(CGFloat)byBottom {
    CGRect frame = self.frame;
    frame.origin.y = byBottom - frame.size.height;
    self.frame = frame;
}

/// width
- (CGFloat)byWidth {
    return self.frame.size.width;
}

- (void)setByWidth:(CGFloat)byWidth {
    CGRect frame = self.frame;
    frame.size.width = byWidth;
    self.frame = frame;
}

/// height
- (CGFloat)byHeight {
    return self.frame.size.height;
}

- (void)setByHeight:(CGFloat)byHeight {
    CGRect frame = self.frame;
    frame.size.height = byHeight;
    self.frame = frame;
}

/// centerX
- (CGFloat)byCenterX {
    return self.center.x;
}

- (void)setByCenterX:(CGFloat)byCenterX {
    self.center = CGPointMake(byCenterX, self.center.y);
}

/// centerY
- (CGFloat)byCenterY {
    return self.center.y;
}

- (void)setByCenterY:(CGFloat)byCenterY {
    self.center = CGPointMake(self.center.x, byCenterY);
}

/// origin
- (CGPoint)byOrigin {
    return self.frame.origin;
}

- (void)setByOrigin:(CGPoint)byOrigin {
    CGRect frame = self.frame;
    frame.origin = byOrigin;
    self.frame = frame;
}

/// size
- (CGSize)bySize {
    return self.frame.size;
}

- (void)setBySize:(CGSize)bySize {
    CGRect frame = self.frame;
    frame.size = bySize;
    self.frame = frame;
}

/// Get Relative Position From View
- (CGRect)getRelativePositionFromView:(UIView *)view {
    return [self convertRect:self.bounds toView:view];
}

@end

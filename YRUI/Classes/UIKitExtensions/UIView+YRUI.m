//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ群：429899752
//      Email：kingsic@126.com
//      GitHub：https://github.com/kingsic/SGPagingView
//
//  UIView+SGPagingView.m
//  UIView+SGPagingView
//
//  Created by kingsic on 15/7/13.
//  Copyright © 2015年 kingsic. All rights reserved.
//

#import "UIView+YRUI.h"

@implementation UIView (YRUI)
- (void)setYR_x:(CGFloat)YR_x {
    CGRect frame = self.frame;
    frame.origin.x = YR_x;
    self.frame = frame;
}
- (CGFloat)YR_x {
    return self.frame.origin.x;
}

- (void)setYR_y:(CGFloat)YR_y {
    CGRect frame = self.frame;
    frame.origin.y = YR_y;
    self.frame = frame;
}
- (CGFloat)YR_y {
    return self.frame.origin.y;
}

- (void)setYR_width:(CGFloat)YR_width {
    CGRect frame = self.frame;
    frame.size.width = YR_width;
    self.frame = frame;
}
- (CGFloat)YR_width {
    return self.frame.size.width;
}

- (void)setYR_height:(CGFloat)YR_height {
    CGRect frame = self.frame;
    frame.size.height = YR_height;
    self.frame = frame;
}
- (CGFloat)YR_height {
    return self.frame.size.height;
}

- (CGFloat)YR_centerX {
    return self.center.x;
}
- (void)setYR_centerX:(CGFloat)YR_centerX {
    CGPoint center = self.center;
    center.x = YR_centerX;
    self.center = center;
}

- (CGFloat)YR_centerY {
    return self.center.y;
}
- (void)setYR_centerY:(CGFloat)YR_centerY {
    CGPoint center = self.center;
    center.y = YR_centerY;
    self.center = center;
}

- (void)setYR_origin:(CGPoint)YR_origin {
    CGRect frame = self.frame;
    frame.origin = YR_origin;
    self.frame = frame;
}
- (CGPoint)YR_origin {
    return self.frame.origin;
}

- (void)setYR_size:(CGSize)YR_size {
    CGRect frame = self.frame;
    frame.size = YR_size;
    self.frame = frame;
}
- (CGSize)YR_size {
    return self.frame.size;
}
- (CGFloat)YR_left {
    return self.frame.origin.x;
}

- (void)setYR_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)YR_top {
    return self.frame.origin.y;
}

- (void)setYR_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)YR_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYR_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)YR_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYR_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

@end


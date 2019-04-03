//
//  UIView+YRUI.h
//  YRUI
//
//  Created by 崔昌云 on 2019/1/27.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView ()
@property (nonatomic, assign) CGFloat YR_x;
@property (nonatomic, assign) CGFloat YR_y;
@property (nonatomic, assign) CGFloat YR_width;
@property (nonatomic, assign) CGFloat YR_height;
@property (nonatomic, assign) CGFloat YR_centerX;
@property (nonatomic, assign) CGFloat YR_centerY;
@property (nonatomic, assign) CGPoint YR_origin;
@property (nonatomic, assign) CGSize YR_size;

@property (nonatomic, assign) CGFloat YR_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic, assign) CGFloat YR_top;         ///< Shortcut for frame.origin.y
@property (nonatomic, assign) CGFloat YR_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat YR_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@end

NS_ASSUME_NONNULL_END

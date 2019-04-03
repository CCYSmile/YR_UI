//
//  YRSearchInput.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/14.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    YRBadgeViewAlignmentTopLeft,
    YRBadgeViewAlignmentTopRight,
    YRBadgeViewAlignmentTopCenter,
    YRBadgeViewAlignmentCenterLeft,
    YRBadgeViewAlignmentCenterRight,
    YRBadgeViewAlignmentBottomLeft,
    YRBadgeViewAlignmentBottomRight,
    YRBadgeViewAlignmentBottomCenter,
    YRBadgeViewAlignmentCenter
} YRBadgeViewAlignment;

@interface YRBadgeView : UIView

@property (nonatomic, copy) NSString *badgeText;//没有处理
@property int badgeValue;//大于100，变为N

#pragma mark - Customization

@property (nonatomic, assign) YRBadgeViewAlignment badgeAlignment;//徽章出现的位置
@property (nonatomic, strong) UIColor *badgeTextColor;//字体颜色
@property (nonatomic, assign) CGSize badgeTextShadowOffset;//字体阴影偏移
@property (nonatomic, strong) UIColor *badgeTextShadowColor;//字体阴影颜色

@property (nonatomic, strong) UIFont *badgeTextFont;//字体大小

@property (nonatomic, strong) UIColor *badgeBackgroundColor;//背景色

/**
 * @discussion color of the overlay circle at the top. Default is semi-transparent white.圆的最外边那一层颜色
 */
@property (nonatomic, strong) UIColor *badgeOverlayColor;

/**
 * @discussion allows to shift the badge by x and y points.
 设置徽章的位置，中心点移动，以设置的默认位置YRBadgeViewAlignment为(0,0)点,重做坐标系统
 */
@property (nonatomic, assign) CGPoint badgePositionAdjustment;

/**
 * @discussion (optional) If not provided, the superview frame is used.
 * You can use this to position the view if you're drawing it using drawRect instead of `-addSubview:`
 */
@property (nonatomic, assign) CGRect frameToPositionInRelationWith;

/**
 * @discussion optionally init using this method to have the badge automatically added to another view.
 添加徽章一般用这个方法，徽章大小为16X16
 */
- (id)initWithParentView:(UIView *)parentView alignment:(YRBadgeViewAlignment)alignment;

@end

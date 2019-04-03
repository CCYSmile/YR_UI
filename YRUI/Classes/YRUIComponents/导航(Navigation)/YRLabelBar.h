//
//  YRLabelBar.h
//  YRUI
//
//  Created by 崔昌云 on 2019/1/25.
//  Copyright © 2019 CCY. All rights reserved.
//  标签栏

#import <UIKit/UIKit.h>

#import "YRCommonConfig.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    /// 下划线样式
    YSLabelBarIndicatorStyleDefault,
    /// 遮盖样式
    YSLabelBarIndicatorStyleCover,
    /// 固定样式
    YSLabelBarIndicatorStyleFixed,
    /// 动态样式（仅在 YSLabelBarIndicatorScrollStyleDefault 样式下支持）
    YSLabelBarIndicatorStyleDynamic
} YSLabelBarIndicatorStyle;

typedef enum : NSUInteger {
    /// 指示器位置跟随内容滚动而改变
    YSLabelBarIndicatorScrollStyleDefault,
    /// 内容滚动一半时指示器位置改变
    YSLabelBarIndicatorScrollStyleHalf,
    /// 内容滚动结束时指示器位置改变
    YSLabelBarIndicatorScrollStyleEnd
} YSLabelBarIndicatorScrollStyle;

@interface YRLabelBarConfig : YRCommonConfig
@property(nonatomic, assign) NSInteger height;//默认 42
/* YRLabelBar 底部分割线颜色，默认为 lightGrayColor */
@property (nonatomic, strong) UIColor *bottomSeparatorColor;
/** 按钮之间的间距，默认为 20.0f */
@property (nonatomic, assign) CGFloat spacingBetweenButtons;
/** 标题文字字号大小，默认 15 号字体 */
@property (nonatomic, strong) UIFont *titleFont;
/** 标题文字选中字号大小，默认 15 号字体。
 * 一旦开启此属性，YRLabelBar.h 里面的 isOpenTitleTextZoom 属性将不起作用，
 * YRLabelBar.m 内部已做处理 */
@property (nonatomic, strong) UIFont *titleSelectedFont;
/** 普通状态下标题按钮文字的颜色，默认为黑色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 选中状态下标题按钮文字的颜色，默认为红色 */
@property (nonatomic, strong) UIColor *titleSelectedColor;
/** 指示器高度，默认为 2.0f */
@property (nonatomic, assign) CGFloat indicatorHeight;
/** 指示器颜色，默认为红色 */
@property (nonatomic, strong) UIColor *indicatorColor;
/** 指示器的额外宽度，介于按钮文字宽度与按钮宽度之间 */
@property (nonatomic, assign) CGFloat indicatorAdditionalWidth;
/** 指示器动画时间，默认为 0.1f，取值范围 0 ～ 0.3f */
@property (nonatomic, assign) CGFloat indicatorAnimationTime;
/** 指示器样式，默认为 YSLabelBarIndicatorStyleDefault */
@property (nonatomic, assign) YSLabelBarIndicatorStyle indicatorStyle;
/** 指示器圆角大小，默认为 0f */
@property (nonatomic, assign) CGFloat indicatorCornerRadius;
/** 指示器遮盖样式外的其他样式下指示器与底部之间的距离，默认为 0f */
@property (nonatomic, assign) CGFloat indicatorToBottomDistance;
/** 指示器遮盖样式下的边框宽度，默认为 0.0f */
@property (nonatomic, assign) CGFloat indicatorBorderWidth;
/** 指示器遮盖样式下的边框颜色，默认为 clearColor */
@property (nonatomic, strong) UIColor *indicatorBorderColor;
/** 指示器固定样式下宽度，默认为 20.0f；最大宽度并没有做限制，请根据实际情况妥善设置 */
@property (nonatomic, assign) CGFloat indicatorFixedWidth;
/** 指示器动态样式下宽度，默认为 20.0f；最大宽度并没有做限制，请根据实际情况妥善设置 */
@property (nonatomic, assign) CGFloat indicatorDynamicWidth;
/** 指示器滚动位置改变样式，默认为 YSLabelBarIndicatorScrollStyleDefault */
@property (nonatomic, assign) YSLabelBarIndicatorScrollStyle indicatorScrollStyle;
@end


/**
 *  标签栏：
 *  1. 不支持多行，每行支持多个 item，由一维数组 items 控制。
 *  2. 默认自带高度，可以通过相关属性控制。
 *  3. 支持以 UIAppearance 的方式配置样式皮肤。
 */
@interface YRLabelBar : UIView
/**
 *  对象方法创建 YRLabelBar
 *
 *  @param titleNames     标题数组
 */
+ (instancetype)LabelBarWithtitleNames:(NSArray <NSString *>*)titleNames;

/** 用于自定义配置 defaultConfig 自定义配置类 */
@property (nonatomic, strong) YRLabelBarConfig *(^configCallback)(YRLabelBarConfig *defaultConfig,YRLabelBar *labelBar);
/** YRLabelBar 是否需要弹性效果，默认为 YES */
@property (nonatomic, assign) BOOL isNeedBounces;
/** 选中标题按钮下标，默认为 0 */
@property (nonatomic, assign) NSInteger selectedIndex;
/** 重置选中标题按钮下标（用于子控制器内的点击事件改变标题的选中下标）*/
@property (nonatomic, assign) NSInteger resetSelectedIndex;
/** 是否让标题按钮文字有渐变效果，默认为 YES */
@property (nonatomic, assign) BOOL isTitleGradientEffect;
/** 是否开启标题按钮文字缩放效果，默认为 NO */
@property (nonatomic, assign) BOOL isOpenTitleTextZoom;
/** 标题文字缩放比，默认为 0.1f，取值范围 0 ～ 0.3f */
@property (nonatomic, assign) CGFloat titleTextScaling;
/** 是否显示指示器，默认为 YES */
@property (nonatomic, assign) BOOL isShowIndicator;
/** 是否显示底部分割线，默认为 YES */
@property (nonatomic, assign) BOOL isShowBottomSeparator;

@end

NS_ASSUME_NONNULL_END

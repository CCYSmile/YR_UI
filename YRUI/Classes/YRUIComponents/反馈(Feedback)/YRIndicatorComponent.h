//
//  YRIndicatorComponent.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRCommonConfig.h"
NS_ASSUME_NONNULL_BEGIN


typedef enum : NSUInteger {
    YRIndicatorTitlePositionBottom,
    YRIndicatorTitlePositionRight,
} YRIndicatorTitlePosition;

@interface YRIndicatorConfig : YRCommonConfig
@property(nonatomic, strong) NSString *title;//default 正在加载
@property(nonatomic, assign) NSInteger circleSize;//default 28
@property(nonatomic, assign) NSInteger contentSize;//default 90
@property(nonatomic, strong) UIColor *circleColor;//default "#D7F6FF"
@property(nonatomic, strong) UIColor *fillColor;//default tintColor
@property(nonatomic, strong) UIColor *bgColor;//default clear
@property(nonatomic, assign) NSInteger borderRadius;//default 5
@property(nonatomic, strong) id titleStyle;//default: fnt 14 color tintColor
@property(nonatomic, assign) YRIndicatorTitlePosition indicatorTitlePosition;//YRIndicatorTitlePositionBottom
@end

typedef YRIndicatorConfig * (^YRIndicatorBlock)(YRIndicatorConfig *config);
@interface YRIndicatorComponent : UIView

///普通类型指示器
+ (instancetype)IndicatorWithConfig:(YRIndicatorBlock)config;
///方形指示器
+ (instancetype)SquareIndicatorWithConfig:(YRIndicatorBlock)config;

- (void)stop;
@end

NS_ASSUME_NONNULL_END

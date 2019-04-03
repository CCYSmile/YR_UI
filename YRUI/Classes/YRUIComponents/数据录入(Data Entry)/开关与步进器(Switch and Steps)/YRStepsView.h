//
//  YRStepsView.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YRStepsViewStyle) {
    YRStepsViewStyleCircle,// 圆形步进器样式
    YRStepsViewStyleRectangular,// 方形步进器样式
};


@interface YRStepsViewConfig : NSObject

/// 步进器当前数值
@property (nonatomic, assign)  double currNum;
/// 步进器单位步进量
@property (nonatomic, assign)  double stepNum;
/// 步进器样式，默认圆形
@property (nonatomic, assign)  YRStepsViewStyle style;
/// 步进器标题
@property (nonatomic, copy) NSString *title;
/// 最大数量
@property (nonatomic, assign)  double maxNum;
/// 最小数量
@property (nonatomic, assign)  double minNum;

@end


NS_ASSUME_NONNULL_BEGIN

@interface YRStepsView : UIView

@property (nonatomic, assign)  YRStepsViewStyle style;


+(instancetype)initWithConfig:(YRStepsViewConfig *(^)(YRStepsViewConfig *))config;

@end

NS_ASSUME_NONNULL_END

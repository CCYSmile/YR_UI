//
//  YRSlider.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface YRSliderConfig : NSObject

@property(nonatomic)float minmumValue;

@property(nonatomic)float maxmumValue;

@property (nonatomic, assign)  BOOL isClicked;

@property(nonatomic)float sliderHeight;

@end

typedef NS_ENUM(NSUInteger, YRSliderType) {
    YRSliderTypeNormal,// 通常样式
    YRSliderTypeMaxAndMin,// 有最大最小图
};

typedef YRSliderConfig *(^YRSliderConfigBlock)(YRSliderConfig * config);

@interface YRSlider : UISlider

+(instancetype)initWithConfig:(YRSliderConfigBlock)config;

@end

NS_ASSUME_NONNULL_END

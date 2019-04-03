//
//  YRSlider.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRSlider.h"
#import <NerdyUI.h>

@implementation YRSliderConfig


@end

@interface YRSlider()

@property (nonatomic, strong) YRSliderConfig * config;


@end

@implementation YRSlider


/**
 控制Slider滑道的高度

 @param bounds 原有高度
 @return
 */
- (CGRect)trackRectForBounds:(CGRect)bounds
{
    return CGRectMake(self.maximumValueImage.size.width + 11, self.maximumValueImage.size.height /2 - self.config.sliderHeight/2 , CGRectGetWidth(self.frame) - self.maximumValueImage.size.width*2 - 22 , self.config.sliderHeight?:8);
    
}

+(instancetype)initWithConfig:(YRSliderConfigBlock)config{
    return [[YRSlider alloc]initWithConfig:config];
}

-(instancetype)initWithConfig:(YRSliderConfigBlock)config{
    YRSlider *slider = [YRSlider new];
    slider.config = config([YRSliderConfig new]);
    return slider;
}

- (void)setConfig:(YRSliderConfig *)config{
    _config = config;
    [self setUpUI];
}

- (void)setUpUI{
    
    //01.minimumValue  : 当值可以改变时，滑块可以滑动到最小位置的值，默认为0.0
    self.minimumValue = self.config.minmumValue?: 0.0;
    
    //02.maximumValue : 当值可以改变时，滑块可以滑动到最大位置的值，默认为1.0
    self.maximumValue = self.config.maxmumValue?:100.0;
    
    //03.当前值
    self.value = 50;
    
    //04.continuous : 如果设置YES，在拖动滑块的任何时候，滑块的值都会改变。默认设置为YES
    [self setContinuous:self.config.isClicked?:YES];
    
    
    
}
@end

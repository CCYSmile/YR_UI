//
//  YRIndicatorComponent.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRIndicatorComponent.h"
#import "YRIndicator.h"
#import "YRUIKit.h"


@interface YRIndicatorConfig()
@property(nonatomic, assign) BOOL showHudView;//是否展示HUD蒙版
@end

@implementation YRIndicatorConfig
- (instancetype)initDefaultConfig{
    if (self = [super initDefaultConfig]) {
        _title = @"正在加载";
        _circleSize = 28;
        _contentSize = 90;
        _circleColor = Color(@"#D7F6FF");
        _fillColor = self.tintColor;
        _bgColor = UIColorClear;
        _borderRadius = 5;
        _indicatorTitlePosition = YRIndicatorTitlePositionBottom;
        _titleStyle = Style().fnt(14).color(self.tintColor);
        _showHudView = false;
    }
    return self;
}

@end

@interface YRIndicatorComponent ()
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) YRIndicatorConfig *config;
@property(nonatomic, copy) YRIndicatorBlock configBlock;
@property(nonatomic, strong) YRIndicator *indicator;
@end

@implementation YRIndicatorComponent

///普通类型指示器
+ (instancetype)IndicatorWithConfig:(YRIndicatorBlock)config{
    YRIndicatorComponent *view = [[YRIndicatorComponent alloc] init];
    view.configBlock = config;
    return view;
}
///方形指示器
+ (instancetype)SquareIndicatorWithConfig:(YRIndicatorBlock)config{
    YRIndicatorComponent *view = [[YRIndicatorComponent alloc] init];
    view.config.showHudView = YES;
    view.configBlock = config;
    return view;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [YRIndicatorConfig defaultConfig];
        _contentView = View.embedIn(self);
        _titleLabel = Label;
    }
    return self;
}
- (void)setConfigBlock:(YRIndicatorBlock)configBlock{
    _configBlock = configBlock;
    self.config = configBlock?configBlock(self.config):self.config;
}
- (void)setConfig:(YRIndicatorConfig *)config{
    _config = config;
    [self setUpUI];
    [self.indicator start];
}

- (void)setUpUI{
    
    _indicator = [[YRIndicator alloc] initWithFrame:CGRectMake(0, 0, _config.circleSize, _config.circleSize)];
    
   
    UIView * contentStack = View;
    switch (self.config.indicatorTitlePosition) {
        case YRIndicatorTitlePositionRight:{
          contentStack = HorStack(self.indicator,@4,self.titleLabel).centerAlignment;
        }
            break;
        case YRIndicatorTitlePositionBottom:{
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
           contentStack = VerStack(NERSpring,self.indicator,@8,self.titleLabel,NERSpring).centerAlignment;
        }
            break;
        default:
            break;
    }
    if (self.config.showHudView) {
        self.contentView.borderRadius(self.config.borderRadius).bgColor(self.config.bgColor).fixWH(_config.contentSize,_config.contentSize).bgColor(_config.bgColor);
        contentStack.embedIn(self.contentView);
    }else{
        contentStack.embedIn(self);
    }
    self.titleLabel.styles(_config.titleStyle).str(_config.title);
    
    self.indicator.fixWH(_config.circleSize,_config.circleSize);
    self.indicator.radius = self.config.circleSize;
    self.indicator.loadingColor = self.config.fillColor;
    self.indicator.bgColor = self.config.circleColor;
}
- (void)stop{
    [self.indicator end];
}
@end

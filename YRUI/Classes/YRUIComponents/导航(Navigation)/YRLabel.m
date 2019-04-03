//
//  YRLabel.m
//  YRUI
//
//  Created by 崔昌云 on 2019/1/30.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRLabel.h"
#import "YRUIKit.h"

@implementation YRLabelConfig

- (instancetype)initDefaultConfig{
    if (self = [super initDefaultConfig]) {
        self.title = @"标签";
        self.labelColorType = YRLabelColorTypeBgColorLightPrimaryTextColorPrimary;
        self.labelSizeType = YRLabelSizeTypeNormal;
        self.labelShapeType = YRLabelShapeTypeSquare;
    }
    return self;
}

@end

@interface YRLabel()
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) YRLabelConfig *config;
@property(nonatomic, copy) LabelConfigBlock configBlock;
@end

@implementation YRLabel
///普通类型
+ (instancetype)SquareLabelWithConfig:(LabelConfigBlock)config{
    YRLabel *label = [[YRLabel alloc] init];
//    label.config.labelShapeType =
    label.configBlock = config;
    return label;
}
///胶囊类型
+ (instancetype)CapsuleLabelWithConfig:(LabelConfigBlock)config{
    YRLabel *label = [[YRLabel alloc] init];
    label.config.labelShapeType = YRLabelShapeTypeCapsule;
//    label.config
    label.configBlock = config;
    return label;
}
- (void)setConfigBlock:(LabelConfigBlock)configBlock{
    _configBlock = configBlock;
    self.config = configBlock?configBlock(self.config):self.config;
}
- (void)setConfig:(YRLabelConfig *)config{
    _config = config;
    [self setUpUI];
}

- (void)setUpUI{
    NSInteger borderRadius = 4;
    NSInteger height = 36;
    NSInteger font = 16;
    UIColor *bgColor = kYRCOLOR_LIGHT_MAIN_COLOR;
    UIColor *textColor = kYRCOLOR_MAIN_COLOR;
    NSInteger leftMargin = 12;
    NSInteger topMargin = 7;
    
    switch (self.config.labelColorType) {
        case YRLabelColorTypeBgColorLightPrimaryTextColorPrimary:{
            bgColor = kYRCOLOR_LIGHT_MAIN_COLOR;
            textColor = kYRCOLOR_MAIN_COLOR;
        }
            break;
        case YRLabelColorTypeBgColorWhiteTextColor33:{
            bgColor = kYRCOLOR_WHITE;
            textColor = kYRCOLOR_33;
        }
            break;
        case YRLabelColorTypeBgColorPrimaryTextColorWhite:{
            bgColor = kYRCOLOR_MAIN_COLOR;
            textColor = kYRCOLOR_WHITE;
        }
            break;
        default:
            break;
    }
    
    switch (self.config.labelSizeType) {
        case YRLabelSizeTypeNormal:{
            height = 36;
            font = 16;
        }
            break;
        case YRLabelSizeTypeSmall:{
            height = 32;
            font = 14;
            leftMargin = 8;
            
        }
            break;
        default:
            break;
    }
    
    switch (self.config.labelShapeType) {
        case YRLabelShapeTypeCapsule:{
            borderRadius = height/2;
        }
            break;
        case YRLabelShapeTypeSquare:{
            borderRadius = 4;
            
        }
            break;
        default:
            break;
    }
    
    self.bgColor(bgColor).borderRadius(borderRadius).fixHeight(height);
    self.titleLabel.fnt(font).color(textColor).str(self.config.title).embedIn(self,leftMargin,topMargin);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UILabel *titleLabel = Label;
        _config = [YRLabelConfig defaultConfig];
        _titleLabel = titleLabel;
    }
   return self;
}
@end

//
//  YRLabel.h
//  YRUI
//
//  Created by 崔昌云 on 2019/1/30.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRCommonConfig.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YRLabelSizeTypeNormal,//普通类型,h:36
    YRLabelSizeTypeSmall,//偏小一点:h:32
} YRLabelSizeType;

typedef enum : NSUInteger {
    YRLabelShapeTypeSquare,//borderRadius:4
    YRLabelShapeTypeCapsule,//borderRadius:胶囊状
} YRLabelShapeType;

typedef enum : NSUInteger {
    YRLabelColorTypeBgColorLightPrimaryTextColorPrimary,
    YRLabelColorTypeBgColorPrimaryTextColorWhite,
    YRLabelColorTypeBgColorWhiteTextColor33,
} YRLabelColorType;

@interface YRLabelConfig : YRCommonConfig
@property(nonatomic, strong) NSString *title;
@property(nonatomic, assign) YRLabelShapeType labelShapeType;//形状
@property(nonatomic, assign) YRLabelSizeType labelSizeType;//大小
@property(nonatomic, assign) YRLabelColorType labelColorType;
@end

typedef YRLabelConfig * (^LabelConfigBlock)(YRLabelConfig *config);

@interface YRLabel : UIView
///普通类型
+ (instancetype)SquareLabelWithConfig:(LabelConfigBlock)config;
///胶囊类型
+ (instancetype)CapsuleLabelWithConfig:(LabelConfigBlock)config;
@end

NS_ASSUME_NONNULL_END

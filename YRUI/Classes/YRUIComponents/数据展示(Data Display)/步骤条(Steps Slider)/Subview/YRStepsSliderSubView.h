//
//  YRStepsSliderSubView.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YRStepsSubviewType) {
    YRStepsSubviewTypeBeginning,// 过程开始
    YRStepsSubviewTypeMiddle,// 中间视图
    YRStepsSubviewTypeEnding,// 结尾
};
typedef NS_ENUM(NSUInteger, YRStepsSubviewStatus) {
    YRStepsSubviewStatusFinished,// 已完成
    YRStepsSubviewStatusUnfinished,// 未完成
};
NS_ASSUME_NONNULL_BEGIN

@interface YRStepsSubviewModel : NSObject

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *subtitleStr;

@end

@interface YRStepsSliderSubView : UIView


/// status 状态，已完成/未完成
@property (nonatomic, assign)  YRStepsSubviewStatus status;

/// 数据源
@property (nonatomic, strong) YRStepsSubviewModel *model;

- (instancetype)initWithType:(YRStepsSubviewType)type;
@end

NS_ASSUME_NONNULL_END

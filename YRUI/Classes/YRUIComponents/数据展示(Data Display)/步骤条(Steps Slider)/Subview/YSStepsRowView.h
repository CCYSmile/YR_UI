//
//  YSStepsRowView.h
//  DemoUI
//
//  Created by 李书涛 on 2019/2/12.
//  Copyright © 2019 李书涛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YRStepsRowViewType) {
    YRStepsRowViewTypeBeginning,// 过程开始
    YRStepsRowViewTypeMiddle,// 中间视图
    YRStepsRowViewTypeEnding,// 结尾
};
typedef NS_ENUM(NSUInteger, YRStepsRowViewStatus) {
    YRStepsRowViewStatusFinished,// 已完成
    YRStepsRowViewStatusUnfinished,// 未完成
};

NS_ASSUME_NONNULL_BEGIN

@interface YRStepsRowView : UIView

/// type 样式，开始/中间/结束
@property (nonatomic, assign)  YRStepsRowViewType type;

/// status 状态，已完成/未完成
@property (nonatomic, assign)  YRStepsRowViewStatus status;

-(instancetype)initWithType:(YRStepsRowViewType)type;

@end

NS_ASSUME_NONNULL_END

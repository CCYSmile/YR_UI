//
//  YRNoticeView.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YRNoticeViewType) {
    YRNoticeViewTypePush,// 跳转
    YRNoticeViewTypeAlert,// 提示
    YRNoticeViewTypeAlertAndCancel,// 提示允许关闭
    YRNoticeViewTypeTextAndCancel,// 纯文字允许关闭
    YRNoticeViewTypeText,// 纯文本
};

@interface YRNoticeViewConfig : NSObject

-(YRNoticeViewConfig *(^)(id title))title;

-(YRNoticeViewConfig*(^)(YRNoticeViewType type))type;

@end



NS_ASSUME_NONNULL_BEGIN

@interface YRNoticeView : UIView

@property (nonatomic, copy)  void(^NoticeClickEvent)(void);

/**
 初始化方法

 @param title 提示文案
 @param type 提示样式
 @return
 */
+ (instancetype)initWithTitle:(NSString *)title andType:(YRNoticeViewType)type;

+ (instancetype)initWithConfig:(YRNoticeViewConfig *(^)(YRNoticeViewConfig *))config;

#define NoticeView [YRNoticeView new]
@end

NS_ASSUME_NONNULL_END

//
//  YRSwitchView.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YRSwitchView : UIView

/// 开关状态改变后，修改结果回调；
@property (nonatomic, copy)  void(^switchValueChanged)(BOOL isOn);

/**
 初始化方法

 @param title 标题
 @param isOn 开关初始态
 @return 实例
 */
+ (instancetype)initWithTitle:(NSString *)title andInitialStatus:(BOOL)isOn;
@end

NS_ASSUME_NONNULL_END

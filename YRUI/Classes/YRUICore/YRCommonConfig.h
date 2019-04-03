//
//  YRCommonConfig.h
//  YRUI
//
//  Created by 崔昌云 on 2019/1/25.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "YRUICommonDefines.h"

NS_ASSUME_NONNULL_BEGIN
/**
 *  通用配置类：
 *  用于配置YRUI所有的通用配置
 *  子类可以继承用以配置各个组件的独立配置项
 */
@interface YRCommonConfig : NSObject

@property(nonatomic, strong) UIColor *tintColor;// 主题色
// 获取默认配置项的类方法
+ (instancetype)defaultConfig;
// 用以子类重写配置各个组件的独立配置项
- (instancetype)initDefaultConfig;
@end

NS_ASSUME_NONNULL_END

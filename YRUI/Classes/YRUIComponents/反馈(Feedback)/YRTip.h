//
//  YRTip.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

#define Toast    [YRTip new]

@class YRTip;
typedef YRTip* (^YRTipObjectBlock)(id);
typedef YRTip* (^YRTipIntBlock)(NSInteger);
typedef YRTip* (^YRTipBlock)(void);

@interface YRTip : NSObject

/**
 * success
 * Usages: .success(@"成功提示") etc.
 */
- (YRTipObjectBlock)success;

/**
 * fail
 * Usages: .fail(@"失败提示") etc.
 */
- (YRTipObjectBlock)fail;

/**
 * info
 * Usages: .info(@"失败提示") etc.
 */
- (YRTipObjectBlock)info;

/**
 * message
 * Usages: .info(@"消息提示") etc.
 */
- (YRTipObjectBlock)message;

/**
 * parentView
 * Usages: .parentView(superView) etc.
 */
- (YRTipObjectBlock)parentView;

/**
 * contentView
 * Usages: .contentView(superView) etc.
 */
- (YRTipObjectBlock)contentView;
/**
 * parentView
 * Usages: .parentView(contentView) etc.
 */
- (YRTipObjectBlock)showFromBottom;

/**
 * delay time
 * Usages: .delay(superView) etc.
 */
- (YRTipIntBlock)delay;

/**
 * hidden
 * Usages: .hidden() etc.
 */
- (YRTipBlock)hidden;
/**
 * hiddenAfterDelay
 * Usages: .hiddenAfterDelay(time) etc.
 */
- (YRTipIntBlock)hiddenAfterDelay;
@end

NS_ASSUME_NONNULL_END

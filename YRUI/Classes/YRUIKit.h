//
//  YRUIKit.h
//  YRUI
//
//  Created by 崔昌云 on 2019/1/24.
//  Copyright © 2019 CCY. All rights reserved.
//

#ifndef YRUIKit_h
#define YRUIKit_h
static NSString * const YRUI_VERSION = @"1.0.0";

#import <NerdyUI/NerdyUI.h>
#import <QMUIKit/QMUIKit.h>
#import "YRUICommonDefines.h"
#import "YRStyle.h"

#if __has_include("UIView+QMUI.h")
#import "UIView+YRUI.h"
#endif
//反馈(Feedback)
#if __has_include("YRIndicatorComponent.h")
#import "YRIndicatorComponent.h"
#endif
#if __has_include("YRIndicator.h")
#import "YRIndicator.h"
#endif
#if __has_include("YRIndicator.h")
#import "YRIndicator.h"
#endif
#if __has_include("YRTip.h")
#import "YRTip.h"
#endif
#if __has_include("YRDialog.h")
#import "YRDialog.h"
#endif
//导航(Navigation)
#if __has_include("YRLabelBar.h")
#import "YRLabelBar.h"
#endif
#if __has_include("YRLabel.h")
#import "YRLabel.h"
#endif
#if __has_include("YRSegmentSelect.h")
#import "YRSegmentSelect.h"
#endif
#if __has_include("YRPagination.h")
#import "YRPagination.h"
#endif
#if __has_include("YRBubble.h")
#import "YRBubble.h"
#endif
#if __has_include("YRListRow.h")
#import "YRListRow.h"
#endif
//数据录入(Data Entry)
#if __has_include("YRDoubleSlider")
#import "YRDoubleSlider"
#endif
#if __has_include("YRSlider.h")
#import "YRSlider.h"
#endif
#if __has_include("YRLargeButton.h")
#import "YRLargeButton.h"
#endif
#if __has_include("YRCheckView.h")
#import "YRCheckView.h"
#endif
#if __has_include("YRSingleSelectedView.h")
#import "YRSingleSelectedView.h"
#endif
#if __has_include("YRSwitchView.h")
#import "YRSwitchView.h"
#endif
#if __has_include("YRStepsView.h")
#import "YRStepsView.h"
#endif
#if __has_include("YRSearchInput.h")
#import "YRSearchInput.h"
#endif
#if __has_include("YRTextInputView.h")
#import "YRTextInputView.h"
#endif
//数据展示(Data Display)
#if __has_include("YRStepsSlider.h")
#import "YRStepsSlider.h"
#endif
#if __has_include("YRNoticeView.h")
#import "YRNoticeView.h"
#endif
#if __has_include("YRBadgeView.h")
#import "YRBadgeView.h"
#endif
//手势(Gesture)
#if __has_include("YRRefreshFooter.h")
#import "YRRefreshFooter.h"
#endif
#if __has_include("YRRefreshHeader.h")
#import "YRRefreshHeader.h"
#endif

#endif /* YRUIKit_h */

//
//  YRDialog.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define Dialog    [YRDialog new]


@class YRDialog;
typedef void (^YRDialogSectionActionParamsBlock)(NSInteger index,NSString *title);
typedef void (^YRDialogFooterActionParamsBlock)(void);
typedef void (^YRDialogTextFieldParamsBlock)(NSString *value);
typedef void (^YRDialogSelectionParamsBlock)(NSInteger index,NSString *value);

typedef YRDialog* (^YRDialogObjectBlock)(id);
typedef YRDialog* (^YRDialogIntBlock)(NSInteger);
typedef YRDialog* (^YRDialogBoolBlock)(BOOL);
typedef YRDialog* (^YRDialogBlock)(void);
typedef YRDialog* (^YRDialogBlockBlock)(YRDialogSectionActionParamsBlock);
typedef YRDialog* (^YRDialogActionBlock)(YRDialogFooterActionParamsBlock);

typedef YRDialog* (^YRDialogAddTextFieldBlock)( NSString * _Nullable placeHolder,__nullable id style, __nullable YRDialogTextFieldParamsBlock callBack);
typedef YRDialog* (^YRDialogAddSelectionBlock)( NSArray <NSString *>*items,__nullable id style, __nullable YRDialogSelectionParamsBlock callBack);
@interface YRDialog : NSObject

/**
 * show 弹出
 * Usages: .show() etc.
 */
- (YRDialogBlock)show;
/**
 * 只有一个选项
 * Usages: .onlyConfirm() etc.
 */

- (YRDialogBlock)onlyConfirm;
- (YRDialogObjectBlock)title;
- (YRDialogObjectBlock)detail;
- (YRDialogObjectBlock)cancelTitle;
- (YRDialogObjectBlock)confirmTitle;
- (YRDialogObjectBlock)titleStyle;
- (YRDialogObjectBlock)detailStyle;
- (YRDialogObjectBlock)cancelStyle;
- (YRDialogObjectBlock)confirmStyle;
- (YRDialogActionBlock)onCancel;
- (YRDialogActionBlock)onConfirm;
- (YRDialogBlockBlock)onSectionClick;
- (YRDialogAddTextFieldBlock)addTextField;
- (YRDialogAddSelectionBlock)addSelection;
- (YRDialogObjectBlock)addHeaderIcon;
@end

NS_ASSUME_NONNULL_END

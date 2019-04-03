//
//  YRCheckCell.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,YRCheckCellStyle){
    YRCheckCellStyleCommon,
    YRCheckCellStyleOnlyTxt,
    YRCheckCellStyleAllSelected,
};



NS_ASSUME_NONNULL_BEGIN

@interface YRCheckCell : UIView

@property (nonatomic, assign)  YRCheckCellStyle style;

@property (nonatomic, copy)  void(^allSelectedCallback)(BOOL isSelect);

@property (nonatomic, copy)  void(^selectedCallback)(BOOL isSelect);

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign)  BOOL isSelect;



@end


NS_ASSUME_NONNULL_END

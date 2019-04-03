//
//  YRListRow.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRCommonConfig.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YRListRowAccessoryTypeNone,
    YRListRowAccessoryTypeDetail,
} YRListRowAccessoryType;


typedef enum : NSUInteger {
    YRListRowDetailTitleTypeNone,
    YRListRowDetailTitleTypeRight,
    YRListRowDetailTitleTypeBottom
} YRListRowDetailTitleType;

typedef enum : NSUInteger {
    YRListRowTopSeparatorTypeNone,
    YRListRowTopSeparatorTypeFull,
    YRListRowTopSeparatorTypeIndent
} YRListRowTopSeparatorType;

typedef enum : NSUInteger {
    YRListRowBottomSeparatorTypeNone,
    YRListRowBottomSeparatorTypeFull,
    YRListRowBottomSeparatorTypeIndent
} YRListRowBottomSeparatorType;

@interface YRListRowConfig : YRCommonConfig
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *detailTitle;
@property(nonatomic, assign) YRListRowAccessoryType accessoryType;//
@property(nonatomic, assign) YRListRowDetailTitleType detailType;//
@property(nonatomic, assign) YRListRowTopSeparatorType topSeparatorType;//
@property(nonatomic, assign) YRListRowBottomSeparatorType bottomSeparatorType;//
@property(nonatomic, assign) NSInteger rowHeight;
@property(nonatomic, strong) UIView *icon;
@property(nonatomic, strong) id titleStyle;
@property(nonatomic, strong) id detailStyle;
@end
typedef YRListRowConfig * (^ListRowConfigBlock)(YRListRowConfig *config);
@interface YRListRow : UIView

+ (instancetype)ListRowWithConfig:(ListRowConfigBlock)listRowConfigBlock;
@end

NS_ASSUME_NONNULL_END

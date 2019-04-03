//
//  YRPagination.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/12.
//  Copyright © 2019 CCY. All rights reserved.
//  分页圆点

#import <UIKit/UIKit.h>
#import "YRCommonConfig.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    YRPaginationPositionTypeCenter,
    YRPaginationPositionTypeLeft,
    YRPaginationPositionTypeRight,
} YRPaginationPositionType;

@interface YRPaginationConfig : YRCommonConfig
@property(nonatomic, strong) UIColor *dotInactiveColor;//default #DDDDDD
@property(nonatomic, strong) UIColor *dotActiveColor;//default MAIN_COLOE
@property(nonatomic, strong) UIColor *bgColor;//default white
@property(nonatomic, assign) NSInteger dotSize;//default 7
@property(nonatomic, assign) NSInteger middleMargin;//default 9
@property(nonatomic, assign) NSInteger timeInterval;//default 1
@property(nonatomic, assign) YRPaginationPositionType positionType;//default YRPaginationPositionTypeCenter
@property(nonatomic, assign) NSInteger height;//default 20
@end
typedef YRPaginationConfig * (^PaginationConfigBlock)(YRPaginationConfig *config);

@interface YRPagination : UIView
@property(nonatomic, copy) void (^indexOnChangeBlock)(NSInteger currentIndex);
@property(nonatomic, copy) PaginationConfigBlock paginationConfig;
+ (instancetype)PaginationWithTotal:(NSInteger)total;
@end

NS_ASSUME_NONNULL_END

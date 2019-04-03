//
//  YRStepsSlider.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YRStepsSubviewModel;

@interface YRStepsSliderConfig : NSObject

/// 数据源
@property (nonatomic, strong) NSMutableArray<YRStepsSubviewModel *> *dataSource;
/// 完成的步骤
@property (nonatomic, assign)  NSInteger index;


@end

NS_ASSUME_NONNULL_BEGIN

@interface YRStepsSlider : UIView

/// 总步骤数量
@property (nonatomic, assign)  NSInteger count;
/// 步骤
@property (nonatomic, assign)  NSInteger index;
/// 数据源
@property (nonatomic, strong) NSMutableArray<YRStepsSubviewModel *> *dataSource;

-(instancetype)initWithConfig:(YRStepsSliderConfig *(^)(YRStepsSliderConfig *))config;

@end

NS_ASSUME_NONNULL_END

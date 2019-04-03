//
//  YSStepsSliderRowView.h
//  DemoUI
//
//  Created by 李书涛 on 2019/2/12.
//  Copyright © 2019 李书涛. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YRStepsSliderRowConfig : NSObject

/// 数据源
@property (nonatomic, strong) NSMutableArray<NSArray *> *dataSource;
/// 完成的步骤
@property (nonatomic, assign)  NSInteger index;

@end


@interface YRStepsSliderRowView : UIView

@end

NS_ASSUME_NONNULL_END

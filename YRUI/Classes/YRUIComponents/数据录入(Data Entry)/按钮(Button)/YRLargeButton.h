//
//  YRLargeButton.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YRLargeButtonType) {
    YRLargeButtonTypeMain,// 主按钮
    YRLargeButtonTypeAuxiliary,// 辅助按钮
    
};
NS_ASSUME_NONNULL_BEGIN

@interface YRLargeButtonConfig : NSObject
/// 按钮样式
@property (nonatomic, assign)  YRLargeButtonType type;
/// 标题
@property (nonatomic, copy) NSString *title;
/// 旋转过程提示语
@property (nonatomic, copy) NSString *runTips;

@end


typedef YRLargeButtonConfig *(^YRButtonConfig)(YRLargeButtonConfig * config);

@interface YRLargeButton : UIButton

+ (instancetype)initWithConfig:(YRButtonConfig)config;


@end

NS_ASSUME_NONNULL_END

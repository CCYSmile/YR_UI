//
//  YRSegmentSelect.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/12.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YRSegmentSelect : UIView
@property(nonatomic, strong) UISegmentedControl *segmentedControl;
@property(nonatomic, copy) void (^SegmentSelectBlock)(NSString *item,NSInteger index);
+ (instancetype)SegmentSelectWithItems:(NSArray <NSString *>*)items;
@end

NS_ASSUME_NONNULL_END

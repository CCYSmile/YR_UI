//
//  YRIndicator.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface YRIndicator : UIView

@property(nonatomic, strong) UIColor *loadingColor;
@property(nonatomic, strong) UIColor *bgColor;

@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, assign) CGFloat radius;

- (void) start;
- (void) end;
@end

NS_ASSUME_NONNULL_END

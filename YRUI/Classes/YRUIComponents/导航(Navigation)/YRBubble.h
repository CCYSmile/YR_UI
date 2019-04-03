//
//  YRBubble.h
//  YRUI
//
//  Created by 崔昌云 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
typedef void (^YRBubbleOnClickBlock)(NSString *title,NSInteger index);
@interface YRBubble : NSObject

+ (instancetype)showWithTarget:(UIView *_Nonnull)targetView titleList:(NSArray <NSString *>*_Nonnull)titleList iconList:(NSArray <NSString *>*_Nonnull)iconList onClick:(YRBubbleOnClickBlock)onClickBlock;

@end

NS_ASSUME_NONNULL_END

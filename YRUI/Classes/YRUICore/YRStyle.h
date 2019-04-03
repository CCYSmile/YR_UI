//
//  YRStyle.h
//  YRUI
//
//  Created by 崔昌云 on 2019/1/24.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define YR_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kScaleSizeFit (YR_IS_IPHONE ? ((SCREEN_WIDTH < SCREEN_HEIGHT) ? SCREEN_WIDTH / 375.0f : SCREEN_WIDTH / 667.0f) : 1.1f)

@interface YRStyle : NSObject

+ TextBlod32ColorMain;
+ TextBlod18Color33;
+ Text18ColorBlack;
+ Text18Color33;
+ Text18Color66;
+ Text18Color99;
+ Text17ColorBlack;
+ Text17Color33;
+ Text17Color66;
+ Text17Color99;
+ Text16ColorBlack;
+ Text16Color33;
+ Text16Color66;
+ Text16ColorWhite;
+ Text16ColorLightRed;
+ Text16ColorPrimary;
+ Text15ColorBlack;
+ Text15Color33;
+ Text15Color66;
+ Text15Color99;
+ Text14ColorBlack;
+ Text14ColorWhite;
+ Text14Color33;
+ Text14Color66;
+ Text14Color99;
+ Text13ColorBlack;
+ Text13Color33;
+ Text13Color66;
+ Text13Color99;
+ Text12ColorBlack;
+ Text12Color33;
+ Text12Color66;
+ Text12Color99;
@end

NS_ASSUME_NONNULL_END

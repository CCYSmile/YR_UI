//
//  YRCommonConfig.m
//  YRUI
//
//  Created by 崔昌云 on 2019/1/25.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRCommonConfig.h"
#import "YRUIKit.h"

@implementation YRCommonConfig
+ (instancetype)defaultConfig{
    return [[self alloc] initDefaultConfig];
}
- (instancetype)initDefaultConfig{
    if (self = [super init]) {
        self.tintColor = kYRCOLOR_MAIN_COLOR;
    }
    return self;
}
@end

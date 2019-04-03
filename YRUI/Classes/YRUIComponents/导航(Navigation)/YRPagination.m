//
//  YRPagination.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/12.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRPagination.h"
#import "YRUIKit.h"

@implementation YRPaginationConfig

- (instancetype)initDefaultConfig{
    if (self = [super initDefaultConfig]) {
        self.dotInactiveColor = Color(@"#DDDDDD");
        self.dotActiveColor = self.tintColor;
        self.bgColor = kYRCOLOR_WHITE;
        self.dotSize = 7;
        self.timeInterval = 1;
        self.positionType = YRPaginationPositionTypeCenter;
        self.height = 20;
        self.middleMargin = 9;
    }
    return self;
}
@end

@interface YRPagination()
@property(nonatomic, assign) NSInteger total;
@property(nonatomic, strong) NSMutableArray <UIView *>*dots;
@property(nonatomic, strong) YRPaginationConfig *config;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) NSInteger currentIndex;
@end

@implementation YRPagination

+(instancetype)PaginationWithTotal:(NSInteger)total{
    return [[self alloc] initPaginationWithTotal:total];
}
- (instancetype)initPaginationWithTotal:(NSInteger)total
{
    self = [super init];
    if (self) {
        _currentIndex = 0;
        self.total = total;
        self.config = [YRPaginationConfig defaultConfig];
        [self setUpUI];
    }
    return self;
}
- (void)setPaginationConfig:(PaginationConfigBlock)paginationConfig{
    _paginationConfig = paginationConfig;
    self.config = paginationConfig?paginationConfig(self.config):self.config;
    [self setUpUI];
}
- (void)setTotal:(NSInteger)total{
    _total = total;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.dots = @[].mutableCopy;
    for (NSInteger i = 0; i < total; i++) {
        [self.dots addObject:View];
    }
}
- (void)setUpUI{
    self.dots.map(^(UIView *view,NSInteger index) {
        return view.bgColor(index == self.currentIndex?self.config.dotActiveColor:self.config.dotInactiveColor).fixWH(self.config.dotSize,self.config.dotSize).borderRadius(self.config.dotSize/2);
    });
    NSMutableArray *temp = self.dots.mutableCopy;
    switch (self.config.positionType) {
        case YRPaginationPositionTypeCenter:{
            [temp insertObject:NERSpring atIndex:0];
            [temp addObject:NERSpring];
        }
            break;
        case YRPaginationPositionTypeLeft:{
            [temp addObject:NERSpring];
        }
            break;
        case YRPaginationPositionTypeRight:{
            [temp insertObject:NERSpring atIndex:0];
        }
            break;
        default:
            break;
    }
    [NERStack horizontalStackWithItems:temp].embedIn(self, 0,12).gap(self.config.middleMargin);
    
    self.fixHeight(self.config.height).bgColor(self.config.bgColor);
    
    [self stopTimer];
    
    if (self.config.timeInterval && self.total>1) {
        [self startTimer];
    }
}
- (void)startTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.config.timeInterval target:self selector:@selector(next) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
- (void)stopTimer {
   [self.timer invalidate];
   self.timer = nil;
}
- (void)next{
    self.currentIndex++;
    self.currentIndex = self.currentIndex>=self.total?0:self.currentIndex;
    !self.indexOnChangeBlock?:self.indexOnChangeBlock(self.currentIndex);
    self.dots.map(^(UIView *view,NSInteger index) {
        return view.bgColor(index == self.currentIndex?self.config.dotActiveColor:self.config.dotInactiveColor);
    });
}
- (void)dealloc{
    [self stopTimer];
}
@end

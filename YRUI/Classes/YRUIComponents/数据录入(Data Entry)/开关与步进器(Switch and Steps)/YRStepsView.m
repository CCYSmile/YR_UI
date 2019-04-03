//
//  YRStepsView.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

/// 需要处理标题，原始数量，数量极限，单位数量

#import "YRStepsView.h"
#import <NerdyUI.h>

@implementation YRStepsViewConfig

@end

@interface YRStepsView()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIButton *plusImg;
@property (nonatomic, strong) UIButton *reduceImg;

@property (nonatomic, strong) UILabel *numLbl;

///  当前数值
@property (nonatomic, assign) double currNum;
///  单位步进量
@property (nonatomic, assign) double stepNum;
///  步进器最大量
@property (nonatomic, assign)  double maxNum;
///  步进器最小量
@property (nonatomic, assign)  double minNum;

@property (nonatomic, strong) YRStepsViewConfig *config;


@end

@implementation YRStepsView

+(instancetype)initWithConfig:(YRStepsViewConfig *(^)(YRStepsViewConfig *))config{
    return [[YRStepsView alloc]initWithConfig:config];
}

-(instancetype)initWithConfig:(YRStepsViewConfig *(^)(YRStepsViewConfig *))config{
    if (self = [super init]) {
        [self setUpUI];
        self.config = config([YRStepsViewConfig new]);

    }
    
    return self;
}
#pragma mark - Initialize
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

-(void)setConfig:(YRStepsViewConfig *)config{
    _config = config;
    if (config.style) {
        self.style = config.style;
    }
    
    if (config.stepNum) {
        self.stepNum = config.stepNum;
    }
    
    if (config.currNum) {
        self.currNum = config.currNum;
    }
    
    if (config.title) {
        self.titleLbl.str(config.title);
    }
    
    if (config.minNum) {
        self.minNum = config.minNum;
    }
    
    if (config.maxNum) {
        self.maxNum = config.maxNum;
    }
}
#pragma mark - Private
-(void)setUpUI{
    self.currNum = 10.1;
    self.stepNum = 1.1;
    self.maxNum = 15;
    self.minNum = 5;
    //  默认为圆形
    self.style = YRStepsViewStyleCircle;
    
    self.bgColor([UIColor whiteColor]);
    
    self.titleLbl = Label.color(@"#333333").str(@"数量一");
    self.numLbl = Label.fnt(17).color(@"#000000").str(self.currNum);
    //
    self.plusImg = Button.img(@"icon_steperadd_normal1").onClick(^(UIView *v) {
        
//        NSLog(@"点击到plus按钮");
        double number = self.currNum;
        
        number += self.stepNum;
        
        self.currNum = number;
    });
    self.reduceImg = Button.img(@"icon_steperminus_normal1").onClick(^(UIView *v) {
        
        NSLog(@"点击到reduce按钮");
        double number = self.currNum;
        
        number -= self.stepNum;
        
        self.currNum = number;
    });;
    
    HorStack(@12,_titleLbl,NERSpring,_reduceImg,@15, _numLbl,@15,_plusImg,@12).embedIn(self, 10).centerAlignment;
    
    [self addObserver:self forKeyPath:@"currNum" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([change[@"new"] integerValue] >= self.maxNum) {
        // 如果越界
        self.plusImg.enabled = NO;
        if (self.style == YRStepsViewStyleCircle) {
            self.plusImg.img(@"icon_steperplus_grey1");
        }
        else{
            self.plusImg.img(@"icon_steperplus_grey2");
        }
    }
    else{
        self.plusImg.enabled = YES;

        if (self.style == YRStepsViewStyleCircle) {
            self.plusImg.img(@"icon_steperadd_normal1");
        }
        else{
            self.plusImg.img(@"icon_steperplus_light2");
        }
    }
    
    if ([change[@"new"] integerValue] <= self.minNum) {
//        如果越界
        self.reduceImg.enabled = NO;
        if (self.style == YRStepsViewStyleCircle) {
            self.reduceImg.img(@"icon_steperminus_grey1");
        }
        else{
            self.reduceImg.img(@"icon_steperminus_grey2");
        }
    }
    else{
        // 没有越界
        self.reduceImg.enabled = YES;

        if (self.style == YRStepsViewStyleCircle) {
            self.reduceImg.img(@"icon_steperminus_normal1");
        }
        else{
            self.reduceImg.img(@"icon_steperminus_light2");
        }
    }
    
    self.numLbl.str(self.currNum);
//    NSLog(@"监听到有值改变");
    
    
}
#pragma mark - Public
-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate

#pragma mark - SET&&GET
-(void)setStyle:(YRStepsViewStyle)style
{
    _style = style;
    switch (style) {
        case YRStepsViewStyleCircle:
            
            break;
        case  YRStepsViewStyleRectangular:
            self.plusImg.img(@"icon_steperplus_light2");
            self.reduceImg.img(@"icon_steperminus_light2");
            break;
        default:
            break;
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"currNum"];
}
@end

//
//  YRSwitchView.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRSwitchView.h"
#import <NerdyUI.h>
@interface YRSwitchView()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UISwitch *swichView;

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, assign)  BOOL isOn;

@end

@implementation YRSwitchView

#pragma mark - Initialize
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}
+ (instancetype)initWithTitle:(NSString *)title andInitialStatus:(BOOL)isOn{
    return [[YRSwitchView alloc]initWithTitle:title andInitialStatus:isOn];
}

- (instancetype)initWithTitle:(NSString *)title andInitialStatus:(BOOL)isOn{
    if (self = [super init]) {
        self.titleStr = title;
        self.isOn = isOn;
        [self setUpUI];
    }
    return self;
}

#pragma mark - Private
-(void)setUpUI{
    self.bgColor(@"#FFFFFF");
    
    self.titleLbl = Label.fnt(17).color(@"#666666").str(self.titleStr);
    self.swichView = Switch;
    
    _swichView.on = self.isOn;
    HorStack(@12,self.titleLbl,NERSpring,self.swichView,@15).embedIn(self, 12,0,12,0).centerAlignment;
    [self.swichView addTarget:self action:@selector(switchValueChanged:) forControlEvents:(UIControlEventValueChanged)];
}

- (void)switchValueChanged:(UISwitch *)switchView{
    
    !self.switchValueChanged?:self.switchValueChanged(switchView.on);
}

#pragma mark - Public
-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate


@end

//
//  YRLargeButton.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRLargeButton.h"
#import <NerdyUI.h>
#import "LabeledActivityIndicatorView.h"

@implementation YRLargeButtonConfig
@end


@interface YRLargeButton()

@property (nonatomic, copy)  YRLargeButtonConfig* config;
@property (nonatomic, strong) LabeledActivityIndicatorView *btnLAIView;


@end

@implementation YRLargeButton

+ (instancetype)initWithConfig:(YRButtonConfig)config{
    return [[YRLargeButton alloc] initWithConfig:config];
}

- (instancetype)initWithConfig:(YRButtonConfig)config{
    YRLargeButton *btn = [YRLargeButton new];
    btn.config = config([YRLargeButtonConfig new]);
    return btn;
}

- (void)setConfig:(YRLargeButtonConfig *)config{
    _config = config;
    [self setUpUI];
    
}

- (void)setUpUI{
    
    if (self.config.type == YRLargeButtonTypeMain) {
        self.fnt(18).color([UIColor whiteColor]).bgColor(@"#00B7EE").str(@"主按钮 Normal").selectedBgImg(@"#20A1C8").disabledBgImg(@"#CCCCCC");
    }
    else{
        self.fnt(18).color([UIColor blackColor]).bgColor(@"#FFFFFF").str(@"次按钮 Normal").selectedBgImg(@"#F2F2F2").disabledBgImg(@"#CCCCCC");
    }
    self.layer.cornerRadius = 4.f;
    self.layer.masksToBounds = YES;
    
    [self addTarget:self action:@selector(stopLAIViewRotation:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)stopLAIViewRotation:(YRLargeButton *)button {
   
    [self buttonStartLoading:button];
}
- (void)buttonStartLoading:(YRLargeButton *)button {
    if (button.subviews.count > 1) [button.subviews[1] removeFromSuperview];
    
    LabeledActivityIndicatorView *btnLAIView = [[LabeledActivityIndicatorView alloc] initWithActivityIndicatorViewStyle:[button.backgroundColor isEqual:Color(@"#FFFFFF")]?UIActivityIndicatorViewStyleGray: UIActivityIndicatorViewStyleWhite];
    [button addSubview:btnLAIView];
    UIColor *btnColor = button.titleLabel.textColor;
    
    if (!button.config.runTips) {
        [btnLAIView setDescription:@"加载中..." font:nil color:btnColor];

    }
    else{
        [btnLAIView setDescription:button.config.runTips font:nil color:btnColor];
    }
    
    [btnLAIView startRotation];
    // 停止
    [self performSelector:@selector(buttonStopLoading:) withObject:btnLAIView afterDelay:1.0];
}

- (void)buttonStopLoading:(LabeledActivityIndicatorView *)laiView {
    
    [self performSelector:@selector(resetButton:) withObject:laiView afterDelay:1.0];
}

- (void)resetButton:(LabeledActivityIndicatorView *)laiView {
    [laiView stopRotationWithFaild];
}


@end

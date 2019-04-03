//
//  YRTip.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRTip.h"
#import "YRUIKit.h"
#import "QMUIToastContentView.h"

@interface YRTip()
@property(nonatomic, strong) NSString *tipContent;
@property(nonatomic, strong) QMUITips *tips;
@property(nonatomic, strong) UIView *superView;
@property(nonatomic, strong) id customContentView;
@property(nonatomic, assign) NSInteger delayTime;
@end

@implementation YRTip
- (YRTipObjectBlock)success{
    __weak typeof(self) wself = self;
    YRTipObjectBlock result = ^(id value){
        wself.tipContent = value;
        [QMUITips showSucceed:value inView:self.superView hideAfterDelay:self.delayTime];
        return self;
    };
    return result;
}
- (YRTipObjectBlock)fail{
    __weak typeof(self) wself = self;
    YRTipObjectBlock result = ^(id value){
        wself.tipContent = value;
        [QMUITips showError:value inView:self.superView hideAfterDelay:self.delayTime];
        return self;
    };
    return result;
}
- (YRTipObjectBlock)info{
    __weak typeof(self) wself = self;
    YRTipObjectBlock result = ^(id value){
        wself.tipContent = value;
        [QMUITips showInfo:value detailText:@"" inView:self.superView hideAfterDelay:self.delayTime];
        return self;
    };
    return result;
}
- (YRTipObjectBlock)message{
    __weak typeof(self) wself = self;
    YRTipObjectBlock result = ^(id value){
        wself.tipContent = value;
        [QMUITips showWithText:value  inView:self.superView hideAfterDelay:self.delayTime];
        return self;
    };
    return result;
}
- (YRTipIntBlock)delay{
    __weak typeof(self) wself = self;
    YRTipIntBlock result = ^(NSInteger value){
        wself.delayTime = value;
        return self;
    };
    return result;
}
- (YRTipObjectBlock)parentView{
    __weak typeof(self) wself = self;
    YRTipObjectBlock result = ^(id value){
        if (value) {
            wself.superView = value;
        }
        return self;
    };
    return result;
}
- (YRTipObjectBlock)contentView{
    __weak typeof(self) wself = self;
    YRTipObjectBlock result = ^(id value){
        if (value) {
            wself.customContentView = value;
        }
        return self;
    };
    return result;
}
- (YRTipBlock)hidden{
    __weak typeof(self) wself = self;
    YRTipBlock result = ^(){
        [wself.tips hideAnimated:YES];
        return self;
    };
    return result;
}
- (YRTipIntBlock)hiddenAfterDelay;{
    __weak typeof(self) wself = self;
    YRTipIntBlock result = ^(NSInteger value){
        [wself.tips hideAnimated:YES afterDelay:value];
        return self;
    };
    return result;
}
- (YRTipObjectBlock)showFromBottom{
    __weak typeof(self) wself = self;
    YRTipObjectBlock result = ^(id value){
        wself.customContentView = value;
        [wself showTipFromBottom];
        return self;
    };
    return result;
}
- (void)setupTip{
    _tips = [QMUITips createTipsToView:self.superView];
}

- (void)showTipFromBottom{
    [self setupTip];
    _tips.toastPosition = QMUIToastViewPositionBottom;
    
    if ([self.customContentView isKindOfClass:NSString.class]) {
        QMUIToastContentView *customContentView = [[QMUIToastContentView alloc] init];
        customContentView.detailTextLabelText = self.customContentView;
        _tips.contentView = customContentView;
    }else{
        _tips.contentView = self.customContentView;
    }
    
    [_tips showAnimated:YES];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _superView = [UIApplication sharedApplication].delegate.window;
        _delayTime = 2;
    }
    return self;
}

@end

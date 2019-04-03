//
//  YRRefreshHeader.m
//  YRUI
//
//  Created by admin on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRRefreshHeader.h"
#import "YRUIKit.h"


@implementation YRRefreshHeaderConfig
- (instancetype)initDefaultConfig{
    if (self = [super initDefaultConfig]) {
        _titleStyle = Style().fnt(20).color(self.tintColor);
    }
    return self;
}
@end

@interface YRRefreshHeader()
@property (nonatomic, strong)  YRRefreshHeaderConfig* config;
@property (nonatomic, copy)  YRRefreshHeaderConfigBlock configBlock;
@end
@implementation YRRefreshHeader
+ (instancetype)headerWithConfigBlock:(YRRefreshHeaderConfigBlock)configBlock RefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    YRRefreshHeader *cmp = [[self alloc] init];
    //如果block存在 则使用block里面回传的config 否则默认config
    cmp.config = configBlock?configBlock(cmp.config):cmp.config;;
    cmp.refreshingBlock = refreshingBlock;
    return cmp;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [YRRefreshHeaderConfig defaultConfig];
    }
    return self;
}
//header的config被赋值
- (void)setConfig:(YRRefreshHeaderConfig *)config{
    _config = config;
    [self setUpUI];
}

- (void)setUpUI{
    if (_config.MJRefreshStateIdleTitle) {
        [self setTitle:_config.MJRefreshStateIdleTitle forState:MJRefreshStateIdle];
    }
    
    if (_config.MJRefreshStatePullingTitle) {
        [self setTitle:_config.MJRefreshStatePullingTitle forState:MJRefreshStatePulling];
    }
    
    if (_config.MJRefreshStateRefreshingTitle) {
        [self setTitle:_config.MJRefreshStateRefreshingTitle forState:MJRefreshStateRefreshing];
    }
    
    if (_config.stateFont) {
        self.stateLabel.font = [UIFont systemFontOfSize:_config.stateFont];
    }
    
    if (_config.lastUpdatedTimeFont) {
        self.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:_config.lastUpdatedTimeFont];
    }
    
    if (_config.stateColor) {
        self.stateLabel.textColor = _config.stateColor;
    }
    
    if (_config.lastUpdatedTimeColor) {
        self.lastUpdatedTimeLabel.textColor = _config.lastUpdatedTimeColor;
    }
    
    if (_config.isShowTime == YES) {
        self.lastUpdatedTimeLabel.hidden = NO;
    }else{
        self.lastUpdatedTimeLabel.hidden = YES;
    }
}
//继承mjrefresh的m默认方法
-(void)prepare{
    [super prepare];
    
    //所有的自定义东西都放在这里
    [self setTitle:@"向下拉动刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"即将刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载 ..." forState:MJRefreshStateRefreshing];
    //一些其他属性设置
     // 设置字体
     self.stateLabel.font = [UIFont systemFontOfSize:14];
     self.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
     // 设置颜色
    self.stateLabel.textColor = [UIColor colorWithRed:0/255.0 green:183/255.0 blue:238/255.0 alpha:1.0];
    self.lastUpdatedTimeLabel.textColor = [UIColor colorWithRed:0/255.0 green:183/255.0 blue:238/255.0 alpha:1.0];
     // 隐藏时间
     self.lastUpdatedTimeLabel.hidden = YES;
     // 隐藏状态
     self.stateLabel.hidden = NO;
     // 设置自动切换透明度(在导航栏下面自动隐藏)
     self.automaticallyChangeAlpha = YES;
}

@end

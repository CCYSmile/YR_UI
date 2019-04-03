//
//  YRRefreshFooter.m
//  YRUI
//
//  Created by admin on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRRefreshFooter.h"
#import "YRUIKit.h"

@implementation YRRefreshFooterConfig

- (instancetype)initDefaultConfig{
    if (self = [super initDefaultConfig]) {
        _titleStyle = Style().fnt(20).color(self.tintColor);
    }
    return self;
}
@end

@interface YRRefreshFooter()
@property(nonatomic, strong)  YRRefreshFooterConfig *config;
@property (nonatomic, copy)  YRRefreshFooterConfigBlock configBlock;
@end
@implementation YRRefreshFooter
//构造方法
+(instancetype)footerWithConfigCallback:(YRRefreshFooterConfigBlock)configBlock RefreshingBlock:(MJRefreshComponentbeginRefreshingCompletionBlock)refreshingBlock{
    
    YRRefreshFooter *footer = [[self alloc] init];
    //如果block存在 则使用block里面回传的config 否则默认config
    footer.config = configBlock?configBlock(footer.config):footer.config;;
    footer.refreshingBlock = refreshingBlock;
    return footer;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [YRRefreshFooterConfig defaultConfig];
    }
    return self;
}
//header的config被赋值
- (void)setConfig:(YRRefreshFooterConfig *)config{
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
    
}
//继承mjrefresh的m默认方法
-(void)prepare{
    [super prepare];
    
    //所有的自定义东西都放在这里
    [self setTitle:@"向上拉动加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"松开立即加载" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载 ..." forState:MJRefreshStateRefreshing];
    //一些其他属性设置
    // 设置字体
    self.stateLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置颜色
    self.stateLabel.textColor = [UIColor colorWithRed:0/255.0 green:183/255.0 blue:238/255.0 alpha:1.0];
    // 隐藏状态
    self.stateLabel.hidden = NO;
    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    self.automaticallyChangeAlpha = YES;
}


@end

//
//  YRRefreshFooter.h
//  YRUI
//
//  Created by admin on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "MJRefreshAutoGifFooter.h"
#import <MJRefresh/MJRefresh.h>
#import "YRCommonConfig.h"

@interface YRRefreshFooterConfig : YRCommonConfig
///下拉还未到刷新状态的title
@property(nonatomic,strong)NSString *MJRefreshStateIdleTitle;
///下拉已经到刷新状态的title
@property(nonatomic,strong)NSString *MJRefreshStatePullingTitle;
///正在加载的title
@property(nonatomic,strong)NSString *MJRefreshStateRefreshingTitle;
/// 状态标签字体大小
@property(nonatomic,assign)NSInteger stateFont;
/// 状态标签颜色
@property(nonatomic,strong)UIColor *stateColor;

@property(nonatomic,strong) id titleStyle;
@end
NS_ASSUME_NONNULL_BEGIN

typedef YRRefreshFooterConfig *( ^YRRefreshFooterConfigBlock)(YRRefreshFooterConfig *config);

@interface YRRefreshFooter : MJRefreshBackGifFooter

+(instancetype)footerWithConfigCallback:(YRRefreshFooterConfigBlock)configBlock RefreshingBlock:(MJRefreshComponentbeginRefreshingCompletionBlock)refreshingBlock;

@end

NS_ASSUME_NONNULL_END

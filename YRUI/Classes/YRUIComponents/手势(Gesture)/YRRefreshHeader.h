//
//  YRRefreshHeader.h
//  YRUI
//
//  Created by admin on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "MJRefreshGifHeader.h"
#import <MJRefresh/MJRefresh.h>
#import "YRCommonConfig.h"

@interface YRRefreshHeaderConfig : YRCommonConfig
///下拉还未到刷新状态的title
@property(nonatomic,strong)NSString *MJRefreshStateIdleTitle;
///下拉已经到刷新状态的title
@property(nonatomic,strong)NSString *MJRefreshStatePullingTitle;
///正在加载的title
@property(nonatomic,strong)NSString *MJRefreshStateRefreshingTitle;
/// 状态标签字体大小
@property(nonatomic,assign)NSInteger stateFont;
/// 上一次更新标签字体大小
@property(nonatomic,assign)NSInteger lastUpdatedTimeFont;
/// 状态标签颜色
@property(nonatomic,strong)UIColor *stateColor;
/// 上一次更新标签颜色
@property(nonatomic,strong)UIColor *lastUpdatedTimeColor;
/// 是否展示时间
@property(nonatomic,assign)BOOL isShowTime;

@property(nonatomic,strong) id titleStyle;
@end
NS_ASSUME_NONNULL_BEGIN

typedef YRRefreshHeaderConfig * (^YRRefreshHeaderConfigBlock)(YRRefreshHeaderConfig *config);

@interface YRRefreshHeader : MJRefreshGifHeader

+ (instancetype)headerWithConfigBlock:(YRRefreshHeaderConfigBlock)configBlock RefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;

@end

NS_ASSUME_NONNULL_END

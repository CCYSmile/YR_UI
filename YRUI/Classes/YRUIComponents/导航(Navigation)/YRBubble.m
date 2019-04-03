//
//  YRBubble.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRBubble.h"
#import <QMUIKit/QMUIKit.h>
#import "YRUIKit.h"

@interface YRBubble()
@property(nonatomic, strong) NSArray *titleList;
@property(nonatomic, strong) UIView *targetView;
@property(nonatomic, strong) NSArray *iconList;
@property(nonatomic, copy)  YRBubbleOnClickBlock onClickBlock;
@property(nonatomic, strong) QMUIPopupMenuView *popupByWindow;
@end

@implementation YRBubble

+ (instancetype)showWithTarget:(UIView *_Nonnull)targetView titleList:(NSArray <NSString *>*_Nonnull)titleList iconList:(NSArray <NSString *>*_Nonnull)iconList onClick:(YRBubbleOnClickBlock)onClickBlock{
    YRBubble *bubble = [YRBubble new];
    bubble.targetView = targetView;
    bubble.iconList = iconList;
    bubble.titleList = titleList;
    bubble.onClickBlock = onClickBlock;
    [bubble show];
    return bubble;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)show{
    
    NSMutableArray *array = @[].mutableCopy;
    self.titleList.map(^(NSString *title,NSInteger index){
        NSString *icon = @"";
        if (self.iconList.count>index) {
            icon = self.iconList[index];
        }
        [array addObject:[QMUIPopupMenuButtonItem itemWithImage:Img(icon) title:title handler:^(QMUIPopupMenuButtonItem *aItem) {
            [aItem.menuView hideWithAnimated:YES];
            !self.onClickBlock?:self.onClickBlock(title,index);
        }]];
        return title;
    });
    self.popupByWindow.items = array;
    self.popupByWindow.sourceView = self.targetView;
    [self.popupByWindow showWithAnimated:YES];
}
- (QMUIPopupMenuView *)popupByWindow{
    if (!_popupByWindow) {
        _popupByWindow = [QMUIPopupMenuView new];
        _popupByWindow.automaticallyHidesWhenUserTap = YES;// 点击空白地方消失浮层
        _popupByWindow.shouldShowItemSeparator = YES;
        _popupByWindow.itemConfigurationHandler = ^(QMUIPopupMenuView *aMenuView, QMUIPopupMenuButtonItem *aItem, NSInteger section, NSInteger index) {
            aItem.button.color(kYRCOLOR_33);;
        };
        _popupByWindow.didHideBlock = ^(BOOL hidesByUserTap) {
            
        };
    }
    return _popupByWindow;
}
@end

//
//  YRStepsSlider.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRStepsSlider.h"
#import "YRStepsSliderSubView.h"
#import <NerdyUI.h>

@implementation YRStepsSliderConfig

@end

@interface YRStepsSlider()

@property (nonatomic, strong) NSMutableArray *subViews;

@property (nonatomic, strong) YRStepsSliderConfig *config;
@end

@implementation YRStepsSlider
{
    id _stack;
}
#pragma mark - Initialize
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _subViews = @[].mutableCopy;
        [self setUpUI];
    }
    return self;
}
- (instancetype)initWithConfig:(YRStepsSliderConfig * _Nonnull (^)(YRStepsSliderConfig * _Nonnull))config{
    if (self = [super init]) {
        self.config = config([YRStepsSliderConfig new]);
    }
    return self;
}

- (void)setConfig:(YRStepsSliderConfig *)config{
    _config = config;
    [_stack removeFromSuperview];
    [_subViews removeAllObjects];
    self.dataSource = config.dataSource;
    [self setUpUI];
    self.index = config.index;

}

#pragma mark - Private
-(void)setUpUI{
    int i = 0;
    while (i< (self.dataSource.count>0?self.dataSource.count :4)) {
        
        YRStepsSliderSubView *subView;
        if (i == 0) {
             subView = [[YRStepsSliderSubView alloc]initWithType:YRStepsSubviewTypeBeginning];
        }
        else if(self.dataSource.count>0 && i== self.dataSource.count - 1){
            subView = [[YRStepsSliderSubView alloc]initWithType:YRStepsSubviewTypeEnding];

        }
        else{
            subView = [[YRStepsSliderSubView alloc]initWithType:YRStepsSubviewTypeMiddle];

        }
        
        [_subViews addObject:subView];
        i++;
    }
    
    for (YRStepsSliderSubView* subView in _subViews) {
        
        NSInteger index = [_subViews indexOfObject:subView];
        
        if (![[_subViews[index] class] isEqual:[YRStepsSliderSubView class]]) {
            continue;
        }
        
        
        YRStepsSubviewModel * model = [YRStepsSubviewModel new];
        model.titleStr = @"标题一行";
        model.subtitleStr = @"副标题一行";
        if (index%2 ) {
            subView.model = model;
        }
        
        if (_dataSource.count >0) {
            if (index >= self.dataSource.count) {
                break;
            }
            subView.model = self.dataSource[index];
        }
    }
    
    [_subViews addObject:NERSpring];
    _stack = [NERStack verticalStackWithItems:_subViews].highResistance.embedIn(self,0);
}

#pragma mark - Public
-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate

#pragma mark - Set&&Get

-(void)setIndex:(NSInteger)index{
    _index = index;
    
    for (YRStepsSliderSubView* subView in _subViews) {
        NSInteger indexSub = [_subViews indexOfObject:subView];
        if (indexSub >=_index) {
            break;
        }
        if (![[_subViews[indexSub] class] isEqual:[YRStepsSliderSubView class]]) {
            continue;
        }
        subView.status = YRStepsSubviewStatusFinished;
        
    }
}


@end

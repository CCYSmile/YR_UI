//
//  YSStepsSliderRowView.m
//  DemoUI
//
//  Created by 李书涛 on 2019/2/12.
//  Copyright © 2019 李书涛. All rights reserved.
//

#import "YRStepsSliderRowView.h"
#import "YSStepsRowView.h"

#import <NerdyUI.h>

@interface YRStepsSliderRowView()

@property (nonatomic, strong) NSMutableArray<YRStepsRowView *> *subViews;

@end

@implementation YRStepsSliderRowView

#pragma mark - Initialize
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.subViews = @[].mutableCopy;
        [self setUpUI];
    }
    return self;
}

#pragma mark - Private
-(void)setUpUI{
    static int i = 5;
    int count = 0;
    while (count<i) {
        YRStepsRowView *view;
        
       
        if (count == 0) {
            view =[[YRStepsRowView alloc]initWithType:YRStepsRowViewTypeBeginning];
        }
        else if (count == i-1) {
            view =[[YRStepsRowView alloc]initWithType:YRStepsRowViewTypeEnding];
         }
        else{
            view =[[YRStepsRowView alloc]initWithType:YRStepsRowViewTypeMiddle];

        }
         [self addSubview:view];
        if (count<2) {
            
            view.status = YRStepsRowViewStatusFinished;
        }
        view.makeCons(^{
            if (count == 0) {
                make.left.equal.constants(14);
            }
            else{
                make.left.equal.view(self.subViews[count - 1]).right.End();
            }
            make.top.bottom.equal.constants(0);
            
            if (count == i-1) {
                make.right.equal.constants(0);
            }
            make.width.equal.constants(88);
        });
        
        [self.subViews addObject:view];
        
        count ++;
    }
    
}

#pragma mark - Public
-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate



@end

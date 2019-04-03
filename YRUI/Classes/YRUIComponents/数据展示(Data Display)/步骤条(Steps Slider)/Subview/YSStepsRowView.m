//
//  YSStepsRowView.m
//  DemoUI
//
//  Created by 李书涛 on 2019/2/12.
//  Copyright © 2019 李书涛. All rights reserved.
//

#import "YSStepsRowView.h"
#import <NerdyUI.h>
@interface YRStepsRowView()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *subTitleLbl;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *roundView;

@end

@implementation YRStepsRowView

#pragma mark - Initialize

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self setUpUI];
    }
    return self;
}

- (instancetype)initWithType:(YRStepsRowViewType)type{
    if (self = [super init]) {
        self.type = type;
        [self setUpUI];
    }
    return self;
}

#pragma mark - Private

-(void)setUpUI{
    
    _roundView = View.bgColor(@"#CCCCCC").addTo(self);
    _roundView.layer.cornerRadius = 5.f;
    _roundView.layer.masksToBounds = YES;
    _roundView.makeCons(^{
        make.top.equal.constants(7.0);
        make.size.equal.constants(10);
        make.left.equal.constants(34);
    });
    
    
    _titleLbl = Label.fnt(12).color(@"#333333").str(@"内容标题1").addTo(self);
    _titleLbl.makeCons(^{
        make.top.equal.view(self.roundView).bottom.constants(12);
        make.centerX.equal.constants(0);
    });
    
    
    _subTitleLbl = Label.fnt(12).color(@"#999999").str(@"标题2").addTo(self).makeCons(^{
        make.centerX.equal.view(self.titleLbl);
        make.top.equal.view(self.titleLbl).bottom.constants(5);
        make.bottom.equal.constants(-8);
    });
    
    
    _lineView = View.bgColor(@"#DDDDDD");
    [self insertSubview:_lineView atIndex:0];
    
    
    if (_type == YRStepsRowViewTypeBeginning) {
        self.lineView.makeCons(^{
            make.height.constants(2);
            make.centerY.equal.view(self.roundView);
            make.right.equal.constants(0);
            make.left.equal.view(self.roundView).left;
        });
        
        
    }
    else if(_type == YRStepsRowViewTypeEnding){
        self.lineView.makeCons(^{
            make.height.constants(2);
            make.centerY.equal.view(self.roundView);
            make.left.equal.constants(0);
            make.right.equal.view(self.roundView).right;
        });
        
    }
    else{
        _lineView.makeCons(^{
            make.height.constants(2);
            make.centerY.equal.view(self.roundView);
            make.left.right.equal.constants(0);
        });
    }
}

#pragma mark - Public

-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate

#pragma mark - Set&&Get

-(void)setType:(YRStepsRowViewType)type{
    
    _type = type;
    
}

-(void)setStatus:(YRStepsRowViewStatus)status{
    _status = status;
    if (status == YRStepsRowViewStatusFinished) {
        _roundView.bgColor(@"#00B7EE");
        _lineView.bgColor(@"#00B7EE");
    }
}

@end

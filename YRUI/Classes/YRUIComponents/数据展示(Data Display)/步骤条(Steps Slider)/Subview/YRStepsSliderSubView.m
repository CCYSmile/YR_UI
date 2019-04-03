//
//  YRStepsSliderSubView.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRStepsSliderSubView.h"
#import <NerdyUI.h>

@implementation YRStepsSubviewModel
@end

@interface YRStepsSliderSubView()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *subTitleLbl;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *roundView;
@property (nonatomic, strong) UIImageView *successIconView;
/// type 样式，开始/中间/结束
@property (nonatomic, assign)  YRStepsSubviewType type;


@end
@implementation YRStepsSliderSubView

#pragma mark - Initialize
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self setUpUI];
    }
    return self;
}

- (instancetype)initWithType:(YRStepsSubviewType)type{
    if (self = [super init]) {
        self.type = type;
        [self setUpUI];
    }
    return self;
}

#pragma mark - Private
-(void)setUpUI{
    
    
    _titleLbl = Label.fnt(17).color(@"#333333").str(@"内容标题内容标题最多2行最多两行最多2行最多两行最多2行最多两行最多2行最多两行").lines(2);
    
    
    _subTitleLbl = Label.fnt(14).color(@"#888888").str(@"内容详情，根据实际文案安排根据实际文案安排内容详情，根据实际文案安排根据实际文案安排11fe").lines(2);
    
    
    
//    id stack = VerStack(roundView,
//                        @-5,
//                        _lineView).centerAlignment;
    _titleLbl.addTo(self).makeCons(^{
        make.left.equal.constants(70);
        make.top.equal.constants(21);
        make.height.greaterEqual.constants(21);
        make.right.equal.constants(-30);
    });
    _subTitleLbl.addTo(self).makeCons(^{
        make.left.equal.view(self->_titleLbl).left.constants(0);
        make.top.equal.view(self->_titleLbl).bottom.constants(5);
        make.bottom.equal.constants(0);
        make.height.greaterEqual.constants(19);
        make.right.equal.constants(-30);

    });
    
    UIView *roundView = View.bgColor(@"#CCCCCC").addTo(self).makeCons(^{
        make.left.equal.constants(40);
        make.centerY.equal.view(self->_titleLbl);
        make.size.equal.constants(10);
    }).highResistance;
    roundView.layer.cornerRadius = 5.f;
    roundView.layer.masksToBounds = YES;
    
    _lineView = View.bgColor(@"#CCCCCC").fixWidth(1).addTo(self).lowHugging;
    
    if (self.type == YRStepsSubviewTypeBeginning) {
        _lineView.makeCons(^{
            make.top.equal.view(roundView).bottom.End();
            //        make.top.equal.constants(0);
            make.bottom.equal.constants(0);
            make.centerX.equal.view(roundView);
        });
    }
    else if(_type == YRStepsSubviewTypeEnding){
        self.lineView.updateCons(^{
            make.top.equal.constants(0);
            make.bottom.equal.view(roundView).top.End();
            make.centerX.equal.view(roundView);
        });
        
    }
    else{
        _lineView.makeCons(^{

            make.top.equal.constants(0);
            make.bottom.equal.constants(0);
            make.centerX.equal.view(roundView);
        });
    }
    
    _successIconView = ImageView.img(@"icon_accomplish").fixWH(25,25).addTo(self).makeCons(^{
        make.center.equal.view(roundView);
    });

    
    [_successIconView setHidden:YES];
    _roundView = roundView;
}

#pragma mark - Public
-(void)updateDataWithDict:(NSDictionary *)dict{
    
}
#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate

#pragma mark - Set&&Get

-(void)setStatus:(YRStepsSubviewStatus)status{
    _status = status;
    if (status == YRStepsSubviewStatusFinished) {
        _titleLbl.color(@"#00B7EE");
        [_successIconView setHidden:NO];
        _lineView.bgColor(@"#00B7EE");
    }
}

-(void)setModel:(YRStepsSubviewModel *)model{
    _model = model;
    _titleLbl.str(model.titleStr);
    _subTitleLbl.str(model.subtitleStr);
}

@end

//
//  YRNoticeView.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRNoticeView.h"
#import <NerdyUI.h>

@interface YRNoticeViewConfig()
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, assign) YRNoticeViewType typeNum;

@end

@implementation YRNoticeViewConfig

-(YRNoticeViewConfig *(^)(id title))title{
    return ^(id title){
        
        self.titleStr = [NSString stringWithFormat:@"%@",title];
        return self;
    };
}

-(YRNoticeViewConfig *(^)(YRNoticeViewType type))type{
    return ^(YRNoticeViewType type){
        self.typeNum = type;
        return self;
    };
}
@end

@interface YRNoticeView()

@property (nonatomic, strong) UIImageView *hornIcon;
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIImageView *cancelIcon;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign)  YRNoticeViewType type;

@property (nonatomic, strong) YRNoticeViewConfig *config;

@property (nonatomic, strong) id stack;

@end

@implementation YRNoticeView

#pragma mark - Initialize

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

+ (instancetype)initWithTitle:(NSString *)title andType:(YRNoticeViewType)type{
    return [[YRNoticeView alloc]initWithTitle:title andType:type];
}

- (instancetype)initWithTitle:(NSString *)title andType:(YRNoticeViewType)type{
    if (self = [super init]) {
        self.title = title;
        [self setUpUI];
        self.type = type;

    }
    return self;
}

+(instancetype)initWithConfig:(YRNoticeViewConfig * _Nonnull (^)(YRNoticeViewConfig * _Nonnull))config{
    YRNoticeView * noticeView = [[YRNoticeView alloc]initWithConfig:config];
    return noticeView;
}

-(instancetype)initWithConfig:(YRNoticeViewConfig * _Nonnull (^)(YRNoticeViewConfig * _Nonnull))config{
    if (self = [super init]) {
        [self setUpUI];
        self.config = config([YRNoticeViewConfig new]);
        
    }
    return self;
}

-(void)setConfig:(YRNoticeViewConfig *)config{
    _config = config;
    
    _titleLbl.str(config.titleStr);
    self.type = config.typeNum;
}
#pragma mark - Private

-(void)setUpUI{
    
    self.bgColor(@"#FBF69C");
    
    _hornIcon = ImageView.img(@"laba.png").fixWH(16,16);
    
    _titleLbl = Label.str(self.title).color(@"#6D6700").fnt(14);
    
    _cancelIcon = ImageView.img(@"push.png").fixWH(16,16);
    /*
    switch (self.type){
            
        case YRNoticeViewTypePush:
            HorStack(@12,_hornIcon,@8,_titleLbl,NERSpring,_cancelIcon,@12).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeAlert:
            HorStack(@12,_hornIcon,@8,_titleLbl,NERSpring).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeAlertAndCancel:
            _cancelIcon.img(@"close.png");
            HorStack(@12,_hornIcon,@8,_titleLbl,NERSpring,_cancelIcon,@12).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeTextAndCancel:
            HorStack(@15,_titleLbl,NERSpring,_cancelIcon,@12).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeText:
            HorStack(@15,_titleLbl,NERSpring,@26).embedIn(self, 0,0,0,0).centerAlignment;
            break;
    }*/
    _stack = HorStack(@12,_hornIcon,@8,_titleLbl,NERSpring,_cancelIcon,@12).embedIn(self, 0,0,0,0).centerAlignment;
    
    
}

#pragma mark - Public

-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate

-(void)setType:(YRNoticeViewType)type{
    _type = type;
    
    [(NERStack*)_stack removeFromSuperview];
    
    switch (type){
            
        case YRNoticeViewTypePush:
            HorStack(@12,_hornIcon,@8,_titleLbl,NERSpring,_cancelIcon,@12).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeAlert:
            HorStack(@12,_hornIcon,@8,_titleLbl,NERSpring).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeAlertAndCancel:
            _cancelIcon.img(@"close.png");
            HorStack(@12,_hornIcon,@8,_titleLbl,NERSpring,_cancelIcon,@12).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeTextAndCancel:
            HorStack(@15,_titleLbl,NERSpring,_cancelIcon,@12).embedIn(self, 0,0,0,0).centerAlignment;
            break;
        case YRNoticeViewTypeText:
            HorStack(@15,_titleLbl,NERSpring,@26).embedIn(self, 0,0,0,0).centerAlignment;
            break;
    }
}


@end

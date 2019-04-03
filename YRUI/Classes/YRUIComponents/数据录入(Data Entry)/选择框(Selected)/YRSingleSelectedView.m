//
//  YRSingleSelectedView.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRSingleSelectedView.h"

#import <NerdyUI.h>

@interface YRSingleSelectedView()

@property (nonatomic, strong) UILabel *titleLbl;

@property (nonatomic, strong) UIImageView *select_1_Img;// 第一个选项的选择按钮
@property (nonatomic, strong) UILabel *select_1_TitleLbl;// 第一个选项的选择标题

@property (nonatomic, strong) UIImageView *select_2_Img;// 第二个选项选择按钮
@property (nonatomic, strong) UILabel *select_2_TitleLbl;// 第二个选项的选择标题

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *titleSelectedStr;
@property (nonatomic, copy) NSString *titleAnotherStr;




@end

@implementation YRSingleSelectedView

#pragma mark - Initialize
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

+(instancetype)initWithTitle:(NSString *)title andSelectTitle:(NSString *)select1
             andAnotherTitle:(NSString *)select2{
    return [[YRSingleSelectedView alloc]initWithTitle:title andSelectTitle:select1 andAnotherTitle:select2];
}

-(instancetype)initWithTitle:(NSString *)title andSelectTitle:(NSString *)select1
             andAnotherTitle:(NSString *)select2{
    if (self = [self init]) {
        self.titleStr = title;
        self.titleSelectedStr = select1;
        self.titleAnotherStr = select2;
        [self setUpUI];

    }
    return self;
}

#pragma mark - Private
-(void)setUpUI{
    
    self.bgColor([UIColor whiteColor]);
    _titleLbl = Label.fnt(16).color(@"#333333").str(self.titleStr);
    
    _select_1_Img = ImageView.img(@"selected.png").fixWH(20,20).onClick(^{
        NSLog(@"_select_1_Img被点击");
        self.select_1_Img.img(@"selected.png");
        self.select_2_Img.img(@"unselected.png");
        !self.singleSelectedResult?:self.singleSelectedResult(1);
    });
    _select_1_TitleLbl = Label.fnt(16).color(@"#333333").str(self.titleSelectedStr).onClick(^{
        NSLog(@"_select_1_Img被点击");
        self.select_1_Img.img(@"selected.png");
        self.select_2_Img.img(@"unselected.png");
        !self.singleSelectedResult?:self.singleSelectedResult(1);
        !self.singleSelectedResult?:self.singleSelectedResult(1);
    });
    
    _select_2_Img = ImageView.img(@"unselected.png").fixWH(20,20).onClick(^{
        NSLog(@"_select_2_Img被点击");
        self.select_2_Img.img(@"selected.png");
        self.select_1_Img.img(@"unselected.png");
        !self.singleSelectedResult?:self.singleSelectedResult(2);
        !self.singleSelectedResult?:self.singleSelectedResult(2);
    });
    _select_2_TitleLbl = Label.fnt(16).color(@"#333333").str(self.titleAnotherStr).onClick(^{
        NSLog(@"_select_2_Img被点击");
        self.select_2_Img.img(@"selected.png");
        self.select_1_Img.img(@"unselected.png");
        !self.singleSelectedResult?:self.singleSelectedResult(2);
        !self.singleSelectedResult?:self.singleSelectedResult(2);
    });
    
    HorStack(@12,_titleLbl,@32,_select_1_Img,@8,_select_1_TitleLbl,@24,_select_2_Img,@8,_select_2_TitleLbl,NERSpring).embedIn(self,0);
    
}


#pragma mark - Public
-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate



@end

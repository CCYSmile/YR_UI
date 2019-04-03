//
//  YRCheckCell.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRCheckCell.h"
#import <NerdyUI.h>

@interface YRCheckCell()

@property (nonatomic, strong) UILabel *lbl;

@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) id allStack;


@end

@implementation YRCheckCell

#pragma mark - Initialize
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - Private
- (void)setUpUI{
    WeakifySelf();
    self.backgroundColor = [UIColor whiteColor];
    _lbl = Label.fnt(17).color(@"#666666").str(@"选项111");
    UIImageView *img = ImageView.img(@"icon_choose");
    _icon = img;
    
    _allStack = HorStack(@16,img,@16,_lbl,NERSpring).embedIn(self, 0).centerAlignment.onClick(^(UIView *v) {
        
        weakSelf.isSelect = !weakSelf.isSelect;
        
        !weakSelf.selectedCallback?:weakSelf.selectedCallback(weakSelf.isSelect);
    });
    self.isSelect = YES;
}

#pragma mark - Public
- (void)updateDataWithDict:(NSDictionary *)dict{
    
}




#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate

#pragma mark - Set&&Get

-(void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if (isSelect) {
        _icon.alpha = 1;
    }
    else{
        _icon.alpha = 0;
    }
}

- (void)setStyle:(YRCheckCellStyle)style{
    if (style == YRCheckCellStyleOnlyTxt) {
        _icon.hidden = YES;
        NERStack *allStack = _allStack;
        allStack.onClick(nil);
    }
    else if(style == YRCheckCellStyleAllSelected){
        NERStack *allStack = _allStack;
        _lbl.str(@"全选");
        WeakifySelf();
        allStack.onClick(^(UIView *v) {
            
            weakSelf.isSelect = !weakSelf.isSelect;
            !weakSelf.allSelectedCallback?:weakSelf.allSelectedCallback(self.isSelect);
            
        });
        
    }
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _lbl.str(title);
}
@end

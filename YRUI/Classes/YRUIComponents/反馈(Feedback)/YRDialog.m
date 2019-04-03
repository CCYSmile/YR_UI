//
//  YRDialog.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/19.
//  Copyright © 2019 CCY. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "YRDialog.h"
#import "YRUIKit.h"

typedef void (^YRDialogSectionActionBlock)(NSInteger index,NSString *title);
typedef void (^YRDialogFooterActionBlock)(void);

@interface YRDialogTextField : NSObject
@property(nonatomic, strong) QMUITextField *textField;
@property(nonatomic, strong) NERStyle *style;
@property(nonatomic, copy) YRDialogTextFieldParamsBlock callBack;
@end
@implementation YRDialogTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textField = [QMUITextField new];
        _style = Style().borderRadius(4).border(1,@"#DDDDDD").fnt(14).color(kYRCOLOR_66);
    }
    return self;
}

@end

@interface YRDialogSelection : NSObject
@property(nonatomic, strong) NERStyle *style;
@property(nonatomic, assign) NSInteger rowHeight;
@property(nonatomic, copy) YRDialogSelectionParamsBlock callBack;
@property(nonatomic, strong) NSArray <NSString *>*items;
@end
@implementation YRDialogSelection

- (instancetype)init
{
    self = [super init];
    if (self) {
        _style = Style().fnt(18).color(kYRCOLOR_66);
        _rowHeight = 50;
    }
    return self;
}

@end

@interface YRDialog()
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *cancelLabel;
@property(nonatomic, strong) UILabel *confirmLabel;
@property(nonatomic, strong) UILabel *detailLabel;
@property(nonatomic, strong) UIView *headerIconView;
@property(nonatomic, assign) BOOL onlyConfirmTag;
@property(nonatomic, copy) YRDialogFooterActionBlock onCancelBlock;
@property(nonatomic, copy) YRDialogFooterActionBlock onConfirmBlock;
@property(nonatomic, copy) YRDialogSectionActionBlock onSectionActionBlock;
@property(nonatomic, strong) NSMutableArray *textFieldList;
@property(nonatomic, strong) YRDialogSelection *selection;
@end

@implementation YRDialog

- (YRDialogBlock)show{
    __weak typeof(self) wself = self;
    return ^{
        [wself showDialog];
        return self;
    };
}

- (YRDialogBlock)onlyConfirm{
    __weak typeof(self) wself = self;
    return ^{
        wself.onlyConfirmTag = YES;
        return self;
    };
}

- (YRDialogObjectBlock)title{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.titleLabel.str(value);
        return self;
    };
}
- (YRDialogObjectBlock)detail{
    __weak typeof(self) wself = self;
    return ^(id value){
         wself.detailLabel.str(value);
        return self;
    };
}
- (YRDialogObjectBlock)titleStyle{
    __weak typeof(self) wself = self;
    return ^(id value){
         wself.titleLabel.styles(value);
        return self;
    };
}
- (YRDialogObjectBlock)detailStyle{
    __weak typeof(self) wself = self;
    return ^(id value){
         wself.detailLabel.styles(value);
        return self;
    };
}
- (YRDialogObjectBlock)cancelStyle{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.cancelLabel.styles(value);
        return self;
    };
}
- (YRDialogObjectBlock)confirmStyle{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.confirmLabel.styles(value);
        return self;
    };
}
- (YRDialogObjectBlock)cancelTitle{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.cancelLabel.str(value);
        return self;
    };
}
- (YRDialogObjectBlock)confirmTitle{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.confirmLabel.str(value);
        return self;
    };
}
- (YRDialogActionBlock)onCancel{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.onCancelBlock = value;
        return self;
    };
}
- (YRDialogActionBlock)onConfirm{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.onConfirmBlock = value;
        return self;
    };
}
- (YRDialogBlockBlock)onSectionClick{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.onSectionActionBlock = value;
        return self;
    };
}
- (YRDialogObjectBlock)addHeaderIcon{
    __weak typeof(self) wself = self;
    return ^(id value){
        wself.headerIconView = value;
        return self;
    };
}

- (YRDialogAddTextFieldBlock)addTextField{
    __weak typeof(self) wself = self;
    return ^(NSString *placeHolder,id style,YRDialogTextFieldParamsBlock callBack){
        YRDialogTextField *view = [YRDialogTextField new];
        if (placeHolder) {
            view.textField.placeholder = placeHolder;
        }
        if (style) {
            view.style = style;
        }
        if (callBack) {
            view.callBack = callBack;
        }
        [wself.textFieldList addObject:view];
        return self;
    };
}
- (YRDialogAddSelectionBlock)addSelection{
    __weak typeof(self) wself = self;
    return ^(NSArray <NSString *>*items,__nullable id style, __nullable YRDialogSelectionParamsBlock callBack){
        YRDialogSelection *selection = [YRDialogSelection new];
        selection.items = items;
        if (style) {
            selection.style = style;
        }
        if (callBack) {
            selection.callBack = callBack;
        }
        wself.selection = selection;
        return self;
    };
}
- (void)showDialog{
    if (self.textFieldList.count) {
        QMUIDialogTextFieldViewController *dialogViewController = [[QMUIDialogTextFieldViewController alloc] init];
        [self setupHeaderTitleContent:dialogViewController];
        [self showTextField:dialogViewController];
        [self showNormal:dialogViewController];
    }else if (self.selection){
        QMUIDialogSelectionViewController *dialogViewController = [[QMUIDialogSelectionViewController alloc] init];
        [self setupHeaderTitleContent:dialogViewController];
        [self showSelection:dialogViewController];
        [dialogViewController show];
    }else{
        QMUIDialogViewController *dialogViewController = [QMUIDialogViewController new];
        [self setupTitleContent:dialogViewController];
        if (self.headerIconView) {
            [self setHeaderIcon:dialogViewController];
        }
        [self showNormal:dialogViewController];
    }
}

- (QMUIDialogViewController *)setupTitleContent:(QMUIDialogViewController *)dialogViewController{
    dialogViewController.headerViewHeight = 0;
    dialogViewController.headerViewBackgroundColor = UIColorClear;
    dialogViewController.headerSeparatorColor = UIColorClear;
    dialogViewController.contentView = self.titleContent;
    return dialogViewController;
}

- (QMUIDialogViewController *)setupHeaderTitleContent:(QMUIDialogViewController *)dialogViewController{
    UIView *titleContent = self.titleContent;
    dialogViewController.headerViewBackgroundColor = UIColorClear;
    dialogViewController.headerSeparatorColor = UIColorClear;
    [dialogViewController.headerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [dialogViewController.headerView addSubview:titleContent];
    dialogViewController.headerViewHeight = titleContent.YR_height-20;
  
    [dialogViewController.view layoutIfNeeded];
    titleContent.makeCons(^{
        make.edge.equal.constants(0).End();
    });
    self.titleLabel.makeCons(^{
        make.centerX.equal.superview.End();
        make.top.equal.constants(21);
        make.size.equal.constants(self.titleLabel.YR_width,self.titleLabel.YR_height).End();
    });
    self.detailLabel.makeCons(^{
        make.centerX.equal.superview.End();
        make.left.equal.superview.constants(20*kScaleSizeFit).End();
        make.right.equal.superview.constants(-20*kScaleSizeFit).End();
        make.top.equal.view(self.titleLabel).bottom.constants(7).End();
    });
    return dialogViewController;
}

- (UIView *)titleContent{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 86)];
    contentView.backgroundColor = UIColorWhite;
    self.detailLabel.YR_width = contentView.YR_width-(21*kScaleSizeFit*2);
    self.titleLabel.YR_width = contentView.YR_width;
    
    [self.detailLabel sizeToFit];
    [self.titleLabel sizeToFit];
    
    
    self.titleLabel.center = CGPointMake(CGRectGetWidth(contentView.bounds) / 2.0, 21 + self.titleLabel.YR_height/2);
    contentView.YR_height = self.detailLabel.YR_height+self.titleLabel.YR_bottom+24;
    
    self.detailLabel.YR_top = self.titleLabel.YR_bottom+7;
    self.detailLabel.YR_centerX = CGRectGetWidth(contentView.bounds) / 2.0;
    
    [contentView addSubview:self.detailLabel];
    [contentView addSubview:self.titleLabel];
    
    return contentView;
}

- (void)setHeaderIcon:(QMUIDialogViewController *)dialogViewController{
    dialogViewController.headerViewHeight = self.headerIconView.YR_height+21;
    [dialogViewController.headerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [dialogViewController.headerView addSubview:self.headerIconView];
    
    self.headerIconView.makeCons(^{
        make.centerX.equal.superview.centerX.End();
        make.top.equal.superview.constants(21).End();
    });
}

- (void)showNormal:(QMUIDialogViewController *)dialogViewController{
    __weak typeof(self) wself = self;
    [dialogViewController addSubmitButtonWithText:self.confirmLabel.text block:^(QMUIDialogViewController *aDialogViewController) {
        [aDialogViewController hide];
        !wself.onConfirmBlock?:wself.onConfirmBlock();
    }];
    
    if (!_onlyConfirmTag) {
        [dialogViewController addCancelButtonWithText:self.cancelLabel.text block:^(__kindof QMUIDialogViewController *aDialogViewController) {
            !wself.onCancelBlock?:wself.onCancelBlock();
        }];
        
        [dialogViewController.cancelButton setAttributedTitle:AttStr(self.cancelLabel.text).color(self.cancelLabel.textColor).fnt(self.cancelLabel.font) forState:UIControlStateNormal];
    }
    
    [dialogViewController.submitButton setAttributedTitle:AttStr(self.confirmLabel.text).color(self.confirmLabel.textColor).fnt(self.confirmLabel.font) forState:UIControlStateNormal];
    [dialogViewController show];
}

- (void)showSelection:(QMUIDialogSelectionViewController *)dialogViewController{
    dialogViewController.items = self.selection.items;
    __weak typeof(self) wself = self;
    [dialogViewController setCellForItemBlock:^(__kindof QMUIDialogSelectionViewController *aDialogViewController, __kindof QMUITableViewCell *cell, NSUInteger itemIndex) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *label = Label.styles(wself.selection.style).centerAlignment.str(cell.textLabel.text);
        label.embedIn(cell.contentView);
        cell.textLabel.str(@"");
    }];
    [dialogViewController setDidSelectItemBlock:^(__kindof QMUIDialogSelectionViewController *aDialogViewController, NSUInteger itemIndex) {
        !wself.selection.callBack?:wself.selection.callBack(itemIndex,wself.selection.items[itemIndex]);
        [aDialogViewController hide];
    }];
    [dialogViewController setHeightForItemBlock:^CGFloat(__kindof QMUIDialogSelectionViewController *aDialogViewController, NSUInteger itemIndex) {
        return wself.selection.rowHeight;
    }];
    [dialogViewController show];
}
- (void)showTextField:(QMUIDialogTextFieldViewController *)dialogViewController{
    
    dialogViewController.textFieldHeight = 36;
    dialogViewController.textFieldSeparatorColor = UIColorClear;
    for (YRDialogTextField *field in self.textFieldList) {
        [dialogViewController addTextFieldWithTitle:nil configurationHandler:^(QMUILabel *titleLabel, QMUITextField *textField, CALayer *separatorLayer) {
            textField.placeholder = field.textField.placeholder;
            textField.border(1,@"#DDDDDD").fnt(field.style.fnt).color(field.style.color).borderRadius(4);
        }];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textFieldList = @[].mutableCopy;
        _titleLabel = Label.styles(YRStyle.Text18ColorBlack);
        _detailLabel = Label.styles(YRStyle.Text15Color99).multiline;
        _cancelLabel = Label.styles(YRStyle.Text18ColorBlack).str(@"关闭");
        _confirmLabel = Label.styles(Style().fnt(18).color(kYRCOLOR_MAIN_COLOR)).str(@"确定");
    }
    return self;
}


@end

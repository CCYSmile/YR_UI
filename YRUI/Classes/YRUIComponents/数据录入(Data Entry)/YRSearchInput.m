//
//  YRSearchInput.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/14.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRSearchInput.h"
#import "YRUIKit.h"

@interface YRSearchInput()<QMUITextFieldDelegate>
@property(nonatomic, strong) QMUITextField *textField;
@property(nonatomic, strong) UIView *placeholderView;
@property(nonatomic, strong) NSString *placeholder;
@end

@implementation YRSearchInput

+ (instancetype)SearchInput{
    return [self new];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _placeholder = @"搜索";
        
        self.bgColor(@"#F2F2F2");
        QMUITextField *textField = [[QMUITextField alloc] init];
        textField.delegate = self;
        textField.clearButtonMode = UITextFieldViewModeAlways;
        textField.fnt(15).bgColor(UIColorWhite).borderRadius(3).fixHeight(28);
        textField.placeholder  = _placeholder;
       
        
        UIButton *cancelBtn = Button.fnt(16).color(UIColorBlack).str(@"取消").fixWidth(59).onClick(^{
             [textField resignFirstResponder];
        });
        
        HorStack(textField,cancelBtn).embedIn(self, 8,9,8,0);
        
        UIView *placeholderView = View.bgColor(UIColorWhite).embedIn(self,8,9).onClick(^{
            [textField becomeFirstResponder];
            [self textFieldDidBeginEditing:textField];
        });
        
        UIView *icon = ImageView.img(@"icon_searchgrey").fixWH(15,15);
        
        UIView *searchicon = View.fixWidth(27);
        ImageView.img(@"icon_searchgrey").fixWH(15,15).embedIn(searchicon, 6,12,6,0);
        textField.leftView = searchicon;
        textField.leftViewMode = UITextFieldViewModeAlways;
        
        
        UILabel *textLabel = Label.fnt(15).color(@"#BBBBBB").str(_placeholder);
        
        _placeholderView = HorStack(icon,@6,textLabel).addTo(placeholderView).makeCons(^{
            make.center.equal.superview.constants(0);
        });
        
        _textField = textField;
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.placeholderView.remakeCons(^{
            make.left.centerY.equal.superview.constants(0);
        });
        [self.placeholderView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.placeholderView.superview.hidden = YES;
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:@""]) {
        self.placeholderView.superview.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.placeholderView.remakeCons(^{
                make.center.equal.superview.constants(0);
            });
             [self.placeholderView.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}
@end

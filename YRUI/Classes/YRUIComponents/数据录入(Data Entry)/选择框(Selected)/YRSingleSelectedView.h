//
//  YRSingleSelectedView.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRSingleSelectedViewStyle : NSObject

@property (nonatomic, strong) NSString *titleStr;



@end


NS_ASSUME_NONNULL_BEGIN

@interface YRSingleSelectedView : UIView

@property (nonatomic, copy)  void(^singleSelectedResult)(NSInteger index);

/**
 初始化方法

 @param title 标题
 @param select1 选项1
 @param select2 选项2
 @return 实例
 */
+(instancetype)initWithTitle:(NSString *)title andSelectTitle:(NSString *)select1
             andAnotherTitle:(NSString *)select2;

@end

NS_ASSUME_NONNULL_END

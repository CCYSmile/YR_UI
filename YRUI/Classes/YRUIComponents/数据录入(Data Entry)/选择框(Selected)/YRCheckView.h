;//
//  YRCheckView.h
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRCheckViewConfig : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray <NSString *>*dataResource;



@end
NS_ASSUME_NONNULL_BEGIN

@interface YRCheckView : UIView

@property (nonatomic, copy)  void(^selectedChange)(NSArray *indexes);

+(instancetype)initWithConfig:(YRCheckViewConfig*(^)(YRCheckViewConfig *))config;

@end

NS_ASSUME_NONNULL_END

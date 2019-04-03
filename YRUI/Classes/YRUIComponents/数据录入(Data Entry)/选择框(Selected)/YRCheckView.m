//
//  YRCheckView.m
//  YRUI
//
//  Created by 李书涛 on 2019/2/15.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRCheckView.h"
#import <NerdyUI.h>
#import "YRCheckCell.h"

@implementation YRCheckViewConfig

@end

@interface YRCheckView()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) NSMutableArray<YRCheckCell *> *listViewArray;
@property (nonatomic, strong) YRCheckViewConfig *config;


@end

@implementation YRCheckView

+(instancetype)initWithConfig:(YRCheckViewConfig*(^)(YRCheckViewConfig *))config{
    return [[YRCheckView alloc]initWithConfig:config];
}

-(instancetype)initWithConfig:(YRCheckViewConfig*(^)(YRCheckViewConfig *))config{
    if (self = [super init]) {
        self.listViewArray = @[].mutableCopy;
        
        self.config = config([YRCheckViewConfig new]);
        
        [self setUpUI];
    }
    return self;
}
#pragma mark - Initialize
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}



#pragma mark - Private
-(void)setUpUI{
    WeakifySelf();
    YRCheckCell *allSelectedCell = [YRCheckCell new];
    allSelectedCell.fixWH([UIScreen mainScreen].width,44);

    allSelectedCell.title = @"全选";
    allSelectedCell.style = YRCheckCellStyleAllSelected;
    allSelectedCell.allSelectedCallback = ^(BOOL isSelect) {
        for (YRCheckCell *cell in self.listViewArray) {
            cell.isSelect = isSelect;
        }
    };
    
    
    
    for(int i = 0;i<(self.config.dataResource.count >0?self.config.dataResource.count:5);i++){
        
        YRCheckCell *cell = [YRCheckCell new];
        cell.fixWH([UIScreen mainScreen].width,44);
        
        if (i == 0) {
            cell.style = YRCheckCellStyleOnlyTxt;
            cell.title = self.config.title;
        }
        else{
            cell.title = self.config.dataResource[i - 1];
            cell.style = YRCheckCellStyleCommon;
            
        }

        cell.selectedCallback = ^(BOOL isSelect) {
            if (!isSelect) {
                allSelectedCell.isSelect = NO;
            }
            for (YRCheckCell *cell in weakSelf.listViewArray) {
                if (cell.isSelect == NO) {
                    break;
                }
                else if ([cell isEqual:weakSelf.listViewArray.lastObject]){
                    allSelectedCell.isSelect = YES;
                }
            }
        };
        [self.listViewArray addObject:cell];
    }
    
    NSMutableArray *viewlist = @[].mutableCopy;
    [viewlist addObjectsFromArray:self.listViewArray];
    [viewlist addObject:@12];
    [viewlist addObject:allSelectedCell];
    [viewlist addObject:NERSpring];
    [NERStack verticalStackWithItems:viewlist].embedIn(self, 0);
}

#pragma mark - Public
-(void)updateDataWithDict:(NSDictionary *)dict{
    
}

#pragma mark - Events

#pragma mark - Callback

#pragma mark - Delegate

#pragma mark - Set&&Get



@end

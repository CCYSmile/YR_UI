//
//  YRSegmentSelect.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/12.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRSegmentSelect.h"
#import "YRUIKit.h"

@interface YRSegmentSelect ()
@property(nonatomic, strong) NSArray *items;
@end

@implementation YRSegmentSelect
+ (instancetype)SegmentSelectWithItems:(NSArray<NSString *> *)items{
    return [[self alloc] initSegmentSelectWithItems:items];
}

- (instancetype)initSegmentSelectWithItems:(NSArray<NSString *> *)items
{
    self = [super init];
    if (self) {
        UISegmentedControl *SegmentedControl = [[UISegmentedControl alloc] initWithItems:items];
        self.fixHeight(32);
        SegmentedControl.tint(kYRCOLOR_MAIN_COLOR);
        SegmentedControl.selectedSegmentIndex = 0;
        [SegmentedControl addTarget:self action:@selector(actionValueChanged:) forControlEvents:UIControlEventValueChanged];
        _segmentedControl = SegmentedControl.embedIn(self);
        self.items = items;
    
        [SegmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateNormal]; //正常
      
        [SegmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];
    }
    return self;
}
- (void)actionValueChanged:(UISegmentedControl*)segmentedControl{
    NSInteger selectIndex = segmentedControl.selectedSegmentIndex;
    !self.SegmentSelectBlock?:self.SegmentSelectBlock(self.items[selectIndex],selectIndex);
}
@end

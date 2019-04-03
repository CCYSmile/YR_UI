//
//  YRListRow.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/13.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRListRow.h"
#import "YRUIKit.h"


@interface YRListRowConfig ()
@property(nonatomic, strong) UIImage *rightArr;
@end

@implementation YRListRowConfig

- (instancetype)initDefaultConfig{
    if (self = [super initDefaultConfig]) {
        _title = @"";
        _detailTitle = @"";
        _titleStyle = Style().styles(YRStyle.Text16Color33).fixHeight(22);
        _detailStyle = Style().styles(YRStyle.Text14Color99).lines(0);
        NSString * rightArrStr = @"iVBORw0KGgoAAAANSUhEUgAAABAAAAAaCAYAAAC+aNwHAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABWWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgpMwidZAAABh0lEQVQ4EZ2V2arCMBCG/9a4oQiCXogi7u//POKGOyoiorh7jv8cOuixta1zEZLJzNcks9T6echsNsP9fkexWERYMXSeTqfid7vdUC6XQzFsy7LUYblcotfr4XEo1flNLF5hsVhgNBqpbSaTQb1eh23bqvOaCICbq9UKw+FQv55Op9FoNBCJRLx8Ra8ArtbrNQaDgUKSySSazSai0agn5AVAq81mg36/L1HhOh6Po9VqIRaLcfkmbwBabLdbdLtdhfAEhCQSiWAAWu12O3Q6HTC0FGOMvEkqlZK1M7iewNnc7/cCuV6vouKD1mo1MEqOfATQ6HA4oN1uw4EwtJVKBdlsVhi+AFodj0eBXC6XP6dH8jFjc7kcAgHodTqdBHI+nwXCoVQqwT/V1Nx9YtzVr9pPV/AF+D3iR0CQMHoCgiaSK8AtlVlULK7/8gYIW0wvgG/KWQHfNhQBsKWNx2NtJGFampnP55hMJvo2LJJqtYrnZqubLhPz3IHz+Xzotm4KhYJwv/2x/ALydvgSn2X4JwAAAABJRU5ErkJggg==";
        NSData * imageData =[[NSData alloc] initWithBase64EncodedString:rightArrStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        _rightArr = [UIImage imageWithData:imageData];
        _topSeparatorType = YRListRowTopSeparatorTypeNone;
        _bottomSeparatorType = YRListRowBottomSeparatorTypeIndent;
        _accessoryType = YRListRowAccessoryTypeDetail;
        _rowHeight = 46;
        _detailType = YRListRowDetailTitleTypeRight;
    }
    return self;
}
@end

@interface YRListRow()
@property(nonatomic, strong) YRListRowConfig *defaultConfig;
@end

@implementation YRListRow

+ (instancetype)ListRowWithConfig:(ListRowConfigBlock)listRowConfigBlock{
    YRListRow *row = [YRListRow new];
    row.defaultConfig = listRowConfigBlock?listRowConfigBlock(row.defaultConfig):row.defaultConfig;
    return row;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _defaultConfig = [YRListRowConfig defaultConfig];
    }
    return self;
}
- (void)setDefaultConfig:(YRListRowConfig *)defaultConfig{
    _defaultConfig = defaultConfig;
    [self setUpUI];
}
- (void)setUpUI{
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIView *iconView = self.defaultConfig.icon;
    UILabel *titleLabel = Label.styles(self.defaultConfig.titleStyle).str(self.defaultConfig.title);
    UILabel *detailLabel = Label.styles(self.defaultConfig.detailStyle).str(self.defaultConfig.detailTitle);
    UIView *arr = ImageView.img(self.defaultConfig.rightArr).fixWH(8,13);
    id lineStyle = Style().fixHeight(1).bgColor(@"#EEEEEE");
    UIView *topSeparator = View.styles(lineStyle);
    UIView *bottomSeparator = View.styles(lineStyle);
    
    switch (self.defaultConfig.accessoryType) {
        case YRListRowAccessoryTypeNone:
        {
            arr = View;
        }
            break;
        case YRListRowAccessoryTypeDetail:
            break;
        default:
            break;
    }
    
    UIView * detailStack = View;
    switch (self.defaultConfig.detailType) {
        case YRListRowDetailTitleTypeNone:
        {
            detailStack = HorStack(titleLabel,NERSpring,arr);
        }
            break;
        case YRListRowDetailTitleTypeRight:
        {
            detailStack = HorStack(titleLabel,NERSpring,detailLabel,@10,arr);
        }
            break;
        case YRListRowDetailTitleTypeBottom:
        {
            detailStack = HorStack(VerStack(titleLabel,@3,detailLabel),NERSpring,@10,arr);
        }
            break;
        default:
            break;
    }
    
    
    
    if (iconView) {
        HorStack(iconView,detailStack).gap(16).embedIn(self,NERNull,16);
    }else{
        HorStack(detailStack).gap(16).embedIn(self,NERNull,16);
    }
    
    switch (self.defaultConfig.topSeparatorType) {
        case YRListRowTopSeparatorTypeNone:
            break;
        case YRListRowTopSeparatorTypeFull:
            topSeparator.embedIn(self, 0,16,NERNull,0);
            break;
        case YRListRowTopSeparatorTypeIndent:
            topSeparator.embedIn(detailStack, 0,0,NERNull,-16);
            break;
        default:
            break;
    }
    
    switch (self.defaultConfig.bottomSeparatorType) {
        case YRListRowBottomSeparatorTypeNone:
            break;
        case YRListRowBottomSeparatorTypeFull:
            bottomSeparator.embedIn(self, NERNull,16,0,0);
            break;
        case YRListRowBottomSeparatorTypeIndent:
            bottomSeparator.embedIn(detailStack, NERNull,0,0,-16);
            break;
        default:
            break;
    }
    self.fixWH(SCREEN_WIDTH,self.defaultConfig.rowHeight);
    detailStack.fixHeight(self.defaultConfig.rowHeight);
}

@end

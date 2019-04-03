//
//  YRSearchInput.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/14.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRBadgeView.h"
#import "YRUIKit.h"
#import <QuartzCore/QuartzCore.h>

#define kDefaultBadgeTextColor [UIColor whiteColor]//数字颜色
#define kDefaultBadgeBackgroundColor [UIColor redColor]//内圆底色
#define kDefaultOverlayColor [UIColor colorWithWhite:1.0f alpha:0.3]
//外边色
#define kDefaultBadgeTextFont [UIFont boldSystemFontOfSize:[UIFont systemFontSize]]//系统字体大小

#define kDefaultBadgeShadowColor [UIColor clearColor]//字体颜色非常细，建议不设置，效果不是很好
//圆的边最外边，颜色 大小
#define kBadgeStrokeColor [UIColor clearColor]
#define kBadgeStrokeWidth 2.0f

#define kMarginToDrawInside (kBadgeStrokeWidth * 2)
//徽章外面的阴影 偏移方向 透明度 颜色 长度
#define kShadowOffset CGSizeMake(0.0f, 3.0f)
#define kShadowOpacity 0.4f
#define kShadowColor [UIColor colorWithWhite:0.0f alpha:kShadowOpacity]
#define kShadowRadius 1.0f
//高度
#define kBadgeHeight 16.0f
#define kBadgeTextSideMargin 8.0f
//圆角度
#define kBadgeCornerRadius 10.0f
//默认位置
#define kDefaultBadgeAlignment YRBadgeViewAlignmentTopRight

@interface YRBadgeView()

- (void)_init;
- (CGSize)sizeOfTextForCurrentSettings;

@end

@implementation YRBadgeView

@synthesize badgeAlignment = _badgeAlignment;

@synthesize badgePositionAdjustment = _badgePositionAdjustment;
@synthesize frameToPositionInRelationWith = _frameToPositionInRelationWith;

@synthesize badgeText = _badgeText;
@synthesize badgeValue = _badgeValue;
@synthesize badgeTextColor = _badgeTextColor;
@synthesize badgeTextShadowColor = _badgeTextShadowColor;
@synthesize badgeTextShadowOffset = _badgeTextShadowOffset;
@synthesize badgeTextFont = _badgeTextFont;
@synthesize badgeBackgroundColor = _badgeBackgroundColor;
@synthesize badgeOverlayColor = _badgeOverlayColor;

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self _init];
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self _init];
    }

    return self;
}

- (id)initWithParentView:(UIView *)parentView alignment:(YRBadgeViewAlignment)alignment
{
    if ((self = [self initWithFrame:CGRectZero]))
    {
        self.badgeAlignment = alignment;
        [parentView addSubview:self];
    }
    
    return self;
}

- (void)_init
{    
    self.backgroundColor = [UIColor clearColor];
    
    self.badgeAlignment = kDefaultBadgeAlignment;
    
    self.badgeBackgroundColor = kYRCOLOR_LIGHT_RED;
    self.badgeOverlayColor = [UIColor clearColor];
    self.badgeTextColor = kDefaultBadgeTextColor;
    self.badgeTextShadowColor = [UIColor clearColor];
    self.badgeTextFont = [UIFont systemFontOfSize:10];
}

#pragma mark - Layout

- (void)layoutSubviews
{    
    CGRect newFrame = self.frame;
    CGRect superviewFrame = CGRectIsEmpty(_frameToPositionInRelationWith) ? self.superview.frame : _frameToPositionInRelationWith;
    
    CGFloat textWidth = [self sizeOfTextForCurrentSettings].width;
    
    CGFloat viewWidth = textWidth + kBadgeTextSideMargin + (kMarginToDrawInside * 2);
    CGFloat viewHeight = kBadgeHeight + (kMarginToDrawInside * 2);
    
    CGFloat superviewWidth = superviewFrame.size.width;
    CGFloat superviewHeight = superviewFrame.size.height;
    
    newFrame.size.width = viewWidth;
    newFrame.size.height = viewHeight;
    
    switch (self.badgeAlignment) {
        case YRBadgeViewAlignmentTopLeft:
            newFrame.origin.x = -viewWidth / 2.0f;
            newFrame.origin.y = -viewHeight / 2.0f;
            break;
        case YRBadgeViewAlignmentTopRight:
            newFrame.origin.x = superviewWidth - (viewWidth / 2.0f);
            newFrame.origin.y = -viewHeight / 2.0f;
            break;
        case YRBadgeViewAlignmentTopCenter:
            newFrame.origin.x = (superviewWidth - viewWidth) / 2.0f;
            newFrame.origin.y = -viewHeight / 2.0f;
            break;
        case YRBadgeViewAlignmentCenterLeft:
            newFrame.origin.x = -viewWidth / 2.0f;
            newFrame.origin.y = (superviewHeight - viewHeight) / 2.0f;
            break;
        case YRBadgeViewAlignmentCenterRight:
            newFrame.origin.x = superviewWidth - (viewWidth / 2.0f);
            newFrame.origin.y = (superviewHeight - viewHeight) / 2.0f;
            break;
        case YRBadgeViewAlignmentBottomLeft:
            newFrame.origin.x = -textWidth / 2.0f;
            newFrame.origin.y = superviewHeight - (viewHeight / 2.0f);            break;
        case YRBadgeViewAlignmentBottomRight:
            newFrame.origin.x = superviewWidth - (viewWidth / 2.0f);
            newFrame.origin.y = superviewHeight - (viewHeight / 2.0f);
            break;
        case YRBadgeViewAlignmentBottomCenter:
            newFrame.origin.x = (superviewWidth - viewWidth) / 2.0f;
            newFrame.origin.y = superviewHeight - (viewHeight / 2.0f);
            break;
        case YRBadgeViewAlignmentCenter:
            newFrame.origin.x = (superviewWidth - viewWidth) / 2.0f;
            newFrame.origin.y = (superviewHeight - viewHeight) / 2.0f;
            break;
        default:
            NSAssert(NO, @"Unimplemented JSBadgeAligment type %d", self.badgeAlignment);
    }
    
    newFrame.origin.x += _badgePositionAdjustment.x;
    newFrame.origin.y += _badgePositionAdjustment.y;
    
    self.frame = CGRectIntegral(newFrame);
    
    [self setNeedsDisplay];
}

#pragma mark - Private

- (CGSize)sizeOfTextForCurrentSettings
{
    return [self.badgeText sizeWithFont:self.badgeTextFont];
}

#pragma mark - Setters

- (void)setBadgeAlignment:(YRBadgeViewAlignment)badgeAlignment
{
    if (badgeAlignment != _badgeAlignment)
    {
        _badgeAlignment = badgeAlignment;

        switch (badgeAlignment)
        {
            case YRBadgeViewAlignmentTopLeft:
                self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
                break;
            case YRBadgeViewAlignmentTopRight:
                self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
                break;
            case YRBadgeViewAlignmentTopCenter:
                self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
                break;
            case YRBadgeViewAlignmentCenterLeft:
                self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
                break;
            case YRBadgeViewAlignmentCenterRight:
                self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
                break;
            case YRBadgeViewAlignmentBottomLeft:
                self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
                break;
            case YRBadgeViewAlignmentBottomRight:
                self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
                break;
            case YRBadgeViewAlignmentBottomCenter:
                self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
                break;
            case YRBadgeViewAlignmentCenter:
                self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
                break;
            default:
                NSAssert(NO, @"Unimplemented JSBadgeAligment type %d", self.badgeAlignment);
        }

        [self setNeedsLayout];
    }
}

- (void)setBadgePositionAdjustment:(CGPoint)badgePositionAdjustment
{
    _badgePositionAdjustment = badgePositionAdjustment;
    
    [self setNeedsLayout];
}

- (void)setBadgeText:(NSString *)badgeText
{
    if (badgeText != _badgeText)
    {
        _badgeText = [badgeText copy];
        
        [self setNeedsDisplay];
    }
}

- (int)badgeValue
{
	return _badgeValue;
}

- (void)setBadgeValue:(int)badgeValue
{
	_badgeValue = badgeValue;
	if (badgeValue>=99)
		self.badgeText = @"99+";
	else
		self.badgeText = [NSString stringWithFormat:@"%d", badgeValue];
	if (badgeValue == 0)
		self.badgeText = @"";
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    if (badgeTextColor != _badgeTextColor)
    {
        _badgeTextColor = badgeTextColor;
        
        [self setNeedsDisplay];
    }
}

- (void)setBadgeTextShadowColor:(UIColor *)badgeTextShadowColor
{
    if (badgeTextShadowColor != _badgeTextShadowColor)
    {
        _badgeTextShadowColor = badgeTextShadowColor;
        
        [self setNeedsDisplay];
    }
}

- (void)setBadgeTextShadowOffset:(CGSize)badgeTextShadowOffset
{
    _badgeTextShadowOffset = badgeTextShadowOffset;
    
    [self setNeedsDisplay];
}

- (void)setBadgeTextFont:(UIFont *)badgeTextFont
{
    if (badgeTextFont != _badgeTextFont)
    {
        _badgeTextFont = badgeTextFont;
        
        [self setNeedsDisplay];
    }
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor
{
    if (badgeBackgroundColor != _badgeBackgroundColor)
    {
        _badgeBackgroundColor = badgeBackgroundColor;
        
        [self setNeedsDisplay];
    }
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    BOOL anyTextToDraw = (self.badgeText.length > 0);
    
    if (anyTextToDraw)
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        CGRect rectToDraw = CGRectInset(rect, kMarginToDrawInside, kMarginToDrawInside);
        
        UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:rectToDraw byRoundingCorners:(UIRectCorner)UIRectCornerAllCorners cornerRadii:CGSizeMake(kBadgeCornerRadius, kBadgeCornerRadius)];
        
        /* Background and shadow */
        CGContextSaveGState(ctx);
        {
            CGContextAddPath(ctx, borderPath.CGPath);
            
            CGContextSetFillColorWithColor(ctx, self.badgeBackgroundColor.CGColor);
//            CGContextSetShadowWithColor(ctx, kShadowOffset, kShadowRadius, kShadowColor.CGColor);
            
            CGContextDrawPath(ctx, kCGPathFill);
        }
        CGContextRestoreGState(ctx);
        
        BOOL colorForOverlayPresent = self.badgeOverlayColor && ![self.badgeOverlayColor isEqual:[UIColor clearColor]];
        
        if (colorForOverlayPresent)
        {
            /* Gradient overlay */
            CGContextSaveGState(ctx);
            {
                CGContextAddPath(ctx, borderPath.CGPath);
                CGContextClip(ctx);
                
                CGFloat height = rectToDraw.size.height;
                CGFloat width = rectToDraw.size.width;
                
                CGRect rectForOverlayCircle = CGRectMake(rectToDraw.origin.x,
                                                         rectToDraw.origin.y - ceilf(height * 0.5),
                                                         width,
                                                         height);
                
                CGContextAddEllipseInRect(ctx, rectForOverlayCircle);
                CGContextSetFillColorWithColor(ctx, self.badgeOverlayColor.CGColor);
                
                CGContextDrawPath(ctx, kCGPathFill);
            }
            CGContextRestoreGState(ctx);
        }
        
      
        
        /* Text */
        CGContextSaveGState(ctx);
        {
            CGContextSetFillColorWithColor(ctx, self.badgeTextColor.CGColor);
            CGContextSetShadowWithColor(ctx, self.badgeTextShadowOffset, 1.0, self.badgeTextShadowColor.CGColor);
            
            CGRect textFrame = rectToDraw;
            CGSize textSize = [self sizeOfTextForCurrentSettings];
            
            textFrame.size.height = textSize.height;
            textFrame.origin.y = rectToDraw.origin.y + ceilf((rectToDraw.size.height - textFrame.size.height) / 2.0f);
            
            [self.badgeText drawInRect:textFrame
                              withFont:self.badgeTextFont
                         lineBreakMode:UILineBreakModeCharacterWrap
                             alignment:UITextAlignmentCenter];
        }
        CGContextRestoreGState(ctx);
    }
}

@end

//
//  YRIndicator.m
//  YRUI
//
//  Created by 崔昌云 on 2019/2/18.
//  Copyright © 2019 CCY. All rights reserved.
//

#import "YRIndicator.h"
static NSString * const YRIndicatorAnimationKey = @"YRIndicatorAnimationKey";

@interface YRIndicator ()<CAAnimationDelegate>

@property(nonatomic, strong) CAShapeLayer *asmLayer;
@property(nonatomic, strong) CAShapeLayer *fillLayer;

@end

@implementation YRIndicator


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void) setup {
    self.loadingColor = [UIColor colorWithRed:0x46/255.0 green:0x4d/255.0 blue:0x65/255.0 alpha:1.0];
    self.backgroundColor = [UIColor clearColor];
    self.lineWidth = 2;
    self.radius  = 28;
}


#pragma mark - public

- (void)start {
    [self reset];
    [self loading];
   
}

- (void)end{
    [self.layer removeAllAnimations];
    [self.asmLayer removeAllAnimations];
}

- (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    //线的宽度
    self.asmLayer.lineWidth = lineWidth;
    self.fillLayer.lineWidth = lineWidth;
}
- (CAShapeLayer *)asmLayer {
    if (_asmLayer == nil) {
        _asmLayer = [CAShapeLayer layer];
    }
    return _asmLayer;
}
- (CAShapeLayer *)fillLayer{
    if (!_fillLayer) {
        _fillLayer = [CAShapeLayer layer];
    }
    return _fillLayer;
}

#pragma mark - reset
- (void)reset {
    [self.layer removeAllAnimations];
}

- (void) loading {
    
    UIBezierPath * fillpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)) radius:self.radius/2 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    self.fillLayer.strokeColor = self.bgColor.CGColor;
    self.fillLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.asmLayer.strokeColor = self.loadingColor.CGColor;
    self.asmLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.asmLayer.path = fillpath.CGPath;
    self.fillLayer.path = fillpath.CGPath;
    
    self.asmLayer.frame = CGRectMake(0, 0, self.radius * 2 + self.lineWidth, self.radius * 2 + self.lineWidth);
    
    
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anima.fromValue = [NSNumber numberWithFloat:0.f];
    anima.toValue = [NSNumber numberWithFloat:1.f];
    anima.duration = 2.0f;
    anima.repeatCount = MAXFLOAT;
    anima.autoreverses = YES;
    anima.removedOnCompletion = NO;
   
    [self.asmLayer addAnimation:anima forKey:@"strokeEndAniamtion"];
    
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima3.toValue = [NSNumber numberWithFloat:-M_PI*2];
    anima3.duration = 1.0f;
    anima3.repeatCount = MAXFLOAT;
    [self.layer addAnimation:anima3 forKey:@"rotaionAniamtion"];
    
    [self.layer addSublayer:self.fillLayer];
    [self.layer addSublayer:self.asmLayer];
}

#pragma mark - success


#pragma mark - error



#pragma mark - exclamationMark

//- (void)exclamationMark {
//    CAShapeLayer *layer = self.asmContentLayer;
//
//    CGFloat partLength = self.radius * 2 / 8;
//    CGFloat pathPartCount = 5;
//    CGFloat visualPathPartCount = 4;
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    CGFloat originY = CGRectGetMidY(self.bounds) - self.radius+pathPartCount;
//    CGFloat destY = originY + partLength * pathPartCount;
//    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
//    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
//
//    //❗️下部分
//    CGFloat partLength2 = self.radius * 2 / 8;
//    CGFloat pathPartCount2 = 1;
//    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    CGFloat originY2 = CGRectGetMidY(self.bounds) + self.radius-partLength2 * pathPartCount2;
//    CGFloat destY2 = originY2 - partLength2 * pathPartCount2;
//    [path2 moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY2)];
//    [path2 addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY2)];
//    layer.fillMode = @"forwards";
//    [path appendPath:path2];
//
//    layer.path = path.CGPath;
//    layer.lineWidth = self.lineWidth;
//    layer.strokeColor = self.exclamationColor.CGColor;
//    layer.fillColor = nil;
//    // end status
//    CGFloat strokeEnd = 1.0;
//
//    // animation
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.duration = 0.5;
//    animation.fromValue = @0;
//    animation.toValue = @(strokeEnd);
//    [animation setValue:@"needShake" forKey:YRIndicatorAnimationKey];
//    animation.delegate = self;
//    [layer addAnimation:animation forKey:nil];
//
//
//}

#pragma mark - shake
- (void)shake {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima.fromValue = @(-M_PI / 12);
    anima.toValue = @(M_PI / 12);
    anima.duration = 0.1;
    anima.autoreverses = YES;
    anima.repeatCount = 4;
    [self.layer addAnimation:anima forKey:nil];
}

#pragma mark - animation delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([[anim valueForKey:YRIndicatorAnimationKey] isEqualToString:@"needShake"]) {
        [self shake];
    }
}
@end

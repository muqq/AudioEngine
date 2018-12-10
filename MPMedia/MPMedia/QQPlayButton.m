
//
//  QQPlayButton.m
//
//  Created by muqq on 2015/6/17.
//  Copyright (c) 2017年 QQ. All rights reserved.
//

#import "QQPlayButton.h"

@interface QQPlayButton ()

@property (nonatomic) CGPoint playButtonHorizontalStartPoint;
@property (nonatomic) CGPoint playButtonVerticalStartPoint;
@property (nonatomic) CGPoint pauseButtonStartPoint;
@property (nonatomic) UIBezierPath *playPath;
@property (nonatomic) UIBezierPath *pausePath;
@property (nonatomic) BOOL isAnimationing;

@end

@implementation QQPlayButton

- (void)drawRect:(CGRect)rect {
    self.playPath = nil;
    self.pausePath = nil;
    CGFloat rectWidth = rect.size.width;
    CGFloat rectHeight = rect.size.height;
    self.playButtonHorizontalStartPoint = CGPointMake(rectWidth / 2 - self.buttonSize / 3, rectHeight / 2 - self.buttonSize / 2);
    self.playButtonVerticalStartPoint = CGPointMake(rectWidth / 2 - self.buttonSize / 2, rectHeight / 2 - 2 * self.buttonSize / 3);
    self.pauseButtonStartPoint = CGPointMake(rectWidth / 2 - self.buttonSize / 2, rectHeight / 2 - self.buttonSize / 2);
    if (self.buttonStatus == QQPlayButtonStatusPlay) {
        if (!self.isAnimationing) {
            self.playPath = [self playPathHorizontalWithStartPoint:self.playButtonHorizontalStartPoint size:self.buttonSize];
        }
        [self.playPath fill];
    } else if (self.buttonStatus == QQPlayButtonStatusPause) {
        if (!self.isAnimationing) {
            self.pausePath = [self pausePathVerticalWithStartPoint:self.pauseButtonStartPoint size:self.buttonSize];
        }
        [self.pausePath fill];
    }
}

- (void)changeStatus:(QQPlayButtonStatus)qqPlayButtonStatus animate:(BOOL)hasAnimate; {
    if (hasAnimate) {
        if (self.buttonStatus != qqPlayButtonStatus) {
            self.isAnimationing = YES;
            [self setNeedsDisplay];
            if (qqPlayButtonStatus == QQPlayButtonStatusPlay) {
                [self _animationToPlay];
            } else if (qqPlayButtonStatus == QQPlayButtonStatusPause) {
                [self _animationToPause];
            }
        }
    } else {
        self.buttonStatus = qqPlayButtonStatus;
        [self setNeedsDisplay];
    }
    
}

- (void)_animationToPlay {
    UIBezierPath *playPath = [self playPathVerticalWithStartPoint:self.playButtonVerticalStartPoint size:self.buttonSize];
    UIBezierPath *pausePath = [self pausePathVerticalWithStartPoint:self.pauseButtonStartPoint size:self.buttonSize];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.fillColor = [[UIColor blackColor] CGColor];
    
    [self.layer insertSublayer:shapeLayer atIndex:0];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 0.3f;
    animation.repeatCount = 1.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = (id) [pausePath CGPath];
    animation.toValue = (id) [playPath CGPath];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [shapeLayer addAnimation:animation forKey:@"path"];
    
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI * 90 / 180);
    } completion:^(BOOL finished) {
        self.layer.sublayers = nil;
        self.isAnimationing = NO;
        self.buttonStatus = QQPlayButtonStatusPlay;
        [self setNeedsDisplay];
        self.transform = CGAffineTransformMakeRotation(M_PI * 0 / 180);
    }];
}

- (void)_animationToPause {
    UIBezierPath *playPath = [self playPathHorizontalWithStartPoint:self.playButtonHorizontalStartPoint size:self.buttonSize];
    UIBezierPath *pausePath = [self pausePathHorizontalWithStartPoint:self.pauseButtonStartPoint size:self.buttonSize];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.fillColor = [[UIColor blackColor] CGColor];
    
    [self.layer insertSublayer:shapeLayer atIndex:0];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 0.3f;
    animation.repeatCount = 1.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = (id) [playPath CGPath];
    animation.toValue = (id) [pausePath CGPath];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [shapeLayer addAnimation:animation forKey:@"path"];
    
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI * 90 / 180);
    } completion:^(BOOL finished) {
        self.layer.sublayers = nil;
        self.isAnimationing = NO;
        self.buttonStatus = QQPlayButtonStatusPause;
        [self setNeedsDisplay];
        self.transform = CGAffineTransformMakeRotation(M_PI * 0 / 180);
    }];
}

- (UIBezierPath *)pausePathVerticalWithStartPoint:(CGPoint)start size:(CGFloat)size {
    CGPoint middleTopLeft = CGPointMake(start.x + size / 2 - self.buttonSize / 10, start.y);
    CGPoint middleTopRight = CGPointMake(start.x + size / 2 + self.buttonSize / 10, start.y);
    CGPoint middleBottomLeft = CGPointMake(start.x + size / 2 - self.buttonSize / 10, start.y + size);
    CGPoint middleBottomRight = CGPointMake(start.x + size / 2 + self.buttonSize / 10, start.y + size);
    CGPoint leftBottom = CGPointMake(start.x, start.y + size);
    CGPoint rightBottom = CGPointMake(start.x + size, start.y + size);
    CGPoint leftTop = CGPointMake(start.x, start.y);
    CGPoint rightTop = CGPointMake(start.x + size, start.y);
    
    UIBezierPath *squarePath = [UIBezierPath bezierPath];
    [squarePath moveToPoint:middleTopLeft];
    [squarePath addLineToPoint:leftTop];
    [squarePath addLineToPoint:leftBottom];
    [squarePath addLineToPoint:middleBottomLeft];
    [squarePath addLineToPoint:middleTopLeft];
    
    [squarePath moveToPoint:middleTopRight];
    [squarePath addLineToPoint:rightTop];
    [squarePath addLineToPoint:rightBottom];
    [squarePath addLineToPoint:middleBottomRight];
    [squarePath addLineToPoint:middleTopRight];
    
    [squarePath closePath];
    
    return squarePath;
}

- (UIBezierPath *)pausePathHorizontalWithStartPoint:(CGPoint)start size:(CGFloat)size {
    CGPoint middleTopLeft = CGPointMake(start.x, start.y + size / 2 - self.buttonSize / 10);
    CGPoint middleTopRight = CGPointMake(start.x + size, start.y + size / 2 - self.buttonSize / 10);
    CGPoint middleBottomLeft = CGPointMake(start.x, start.y + size / 2 + self.buttonSize / 10);
    CGPoint middleBottomRight = CGPointMake(start.x + size, start.y + size / 2 + self.buttonSize / 10);
    CGPoint leftBottom = CGPointMake(start.x, start.y + size);
    CGPoint rightBottom = CGPointMake(start.x + size, start.y + size);
    CGPoint leftTop = CGPointMake(start.x, start.y);
    CGPoint rightTop = CGPointMake(start.x + size, start.y);
    
    UIBezierPath *squarePath = [UIBezierPath bezierPath];
    [squarePath moveToPoint:middleTopRight];
    [squarePath addLineToPoint:rightTop];
    [squarePath addLineToPoint:leftTop];
    [squarePath addLineToPoint:middleTopLeft];
    [squarePath addLineToPoint:middleTopRight];
    
    [squarePath moveToPoint:middleBottomRight];
    [squarePath addLineToPoint:rightBottom];
    [squarePath addLineToPoint:leftBottom];
    [squarePath addLineToPoint:middleBottomLeft];
    [squarePath addLineToPoint:middleBottomRight];
    
    [squarePath closePath];
    
    return squarePath;
}

- (UIBezierPath *)playPathHorizontalWithStartPoint:(CGPoint)start size:(CGFloat)size {
    CGPoint middleLeft = CGPointMake(start.x, start.y + size / 2);
    CGPoint middleRight = CGPointMake(start.x + size, start.y + size / 2);
    CGPoint leftTop = CGPointMake(start.x, start.y);
    CGPoint leftBottom = CGPointMake(start.x, start.y + size);
    
    UIBezierPath *triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:middleRight];
    [triangle addLineToPoint:middleRight];
    [triangle addLineToPoint:leftTop];
    [triangle addLineToPoint:middleLeft];
    [triangle addLineToPoint:middleRight];
    
    [triangle addLineToPoint:middleRight];
    [triangle addLineToPoint:leftBottom];
    [triangle addLineToPoint:middleLeft];
    [triangle addLineToPoint:middleRight];
    [triangle closePath];
    
    return triangle;
}
- (UIBezierPath *)playPathVerticalWithStartPoint:(CGPoint)start size:(CGFloat)size {
    CGPoint middleTop = CGPointMake(start.x + size / 2, start.y);
    CGPoint middleBottom = CGPointMake(start.x + size / 2, start.y + size);
    CGPoint leftBottom = CGPointMake(start.x, start.y + size);
    CGPoint rightBottom = CGPointMake(start.x + size, start.y + size);
    
    UIBezierPath *triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:middleTop];
    [triangle addLineToPoint:middleTop];
    [triangle addLineToPoint:leftBottom];
    [triangle addLineToPoint:middleBottom];
    [triangle addLineToPoint:middleTop];
    
    [triangle addLineToPoint:middleTop];
    [triangle addLineToPoint:rightBottom];
    [triangle addLineToPoint:middleBottom];
    [triangle addLineToPoint:middleTop];
    [triangle closePath];
    
    return triangle;
}

@end

//
//  UIView+careLayer.m
//  Zhuan
//
//  Created by txooo on 16/8/15.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import "UIView+careLayer.h"
@implementation UIView (careLayer)

- (void)addCornerLayer{
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, viewWidth, viewHeight);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(viewHeight/2, 0)];
    [path addLineToPoint:CGPointMake(viewWidth, 0)];
    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
    [path addLineToPoint:CGPointMake(viewHeight/2, viewHeight)];
    [path addArcWithCenter:CGPointMake(viewHeight/2, viewHeight/2) radius:viewHeight/2 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
    borderLayer.path = path.CGPath;
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    borderLayer.fillColor = clear_color.CGColor;
    borderLayer.strokeColor = yellow_color.CGColor;
    [self.layer addSublayer:borderLayer];
}

- (void)addCornerLayer2{
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, viewWidth, viewHeight);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(viewHeight/2, 0)];
    [path addLineToPoint:CGPointMake(viewWidth, 0)];
    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
    [path addLineToPoint:CGPointMake(viewHeight/2, viewHeight)];
    [path addArcWithCenter:CGPointMake(viewHeight/2, viewHeight/2) radius:viewHeight/2 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
    borderLayer.path = path.CGPath;
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    borderLayer.fillColor = clear_color.CGColor;
    borderLayer.strokeColor = yellow_color.CGColor;
    [self.layer addSublayer:borderLayer];
}

@end

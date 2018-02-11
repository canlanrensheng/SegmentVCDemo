//
//  UIView+GradientLayer.m
//  Zhuan
//
//  Created by z on 2017/11/29.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "UIView+GradientLayer.h"

@implementation UIView (GradientLayer)
- (void)setGradientLayer:(UIColor*)startColor endColor:(UIColor*)endColor {
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,
                             (__bridge id)endColor.CGColor];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0.0f), @(1.0f)];
}
@end

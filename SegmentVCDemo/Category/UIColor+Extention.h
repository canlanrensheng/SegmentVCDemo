//
//  UIColor+Extention.h
//  Zhuan
//
//  Created by 张金山 on 17/6/26.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extention)

+ (UIColor *) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (UIColor *) colorWithHex:(NSInteger)hexValue;

+ (NSString *) hexFromUIColor: (UIColor*) color;

+ (UIColor *) getColor:(NSString *)hexColor;

@end

//
//  UIFont+CustomFont.m
//  Zhuan
//
//  Created by txooo on 16/7/7.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import "UIFont+Extention.h"

@implementation UIFont (Extention)
+ (UIFont *)fontWithCustomFontwithSize:(CGFloat)size{
    return [self fontWithName:@"iconfont" size:size];
}

+ (UIFont *)fontWithCustomFontV2withSize:(CGFloat)size{
    return [self fontWithName:@"iconfontv2" size:size];
}
@end

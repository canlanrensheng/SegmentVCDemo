//
//  UIBarButtonItem+ZJS_Extention.h
//  彩票
//
//  Created by mac on 16/2/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extention)
//V1.0
+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title size:(CGFloat)fontSize target:(id)target action:(SEL)action;

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title size:(CGFloat)fontSize target:(id)target action:(SEL)action andColor:(UIColor *)color;
//V2.0
+(UIBarButtonItem *)barButtonItemV2WithTitle:(NSString *)title size:(CGFloat)fontSize target:(id)target action:(SEL)action andColor:(UIColor *)color;

@end

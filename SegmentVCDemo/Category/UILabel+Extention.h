//
//  UILabel+Extention.h
//  Zhuan
//
//  Created by 张金山 on 17/6/26.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UILabel *(^ljFrame)(NSString *title, UIFont *font, UIColor *textColor);
@interface UILabel (Extention)

+(UILabel*)labelWithRect:(CGRect)rect text:(NSString*)text font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor alignment:(NSTextAlignment)alignment textColor:(UIColor*)textColor;

+ (UILabel *)creatLabel:(void(^)(UILabel *label))block;

- (UILabel *(^)(float left,float top,float width,float height))ljFrame;
- (UILabel* (^)(NSString *title, UIFont *font, UIColor *textColor))ljTitle_font_textColor;
- (UILabel* (^)(NSTextAlignment aligment))ljAligment;
- (UILabel* (^)(UIColor *color))ljBackgroundColor;
- (UILabel* (^)(NSInteger lines))ljNumberOfLines;

@end

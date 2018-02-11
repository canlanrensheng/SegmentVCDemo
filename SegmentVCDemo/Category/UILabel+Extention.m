//
//  UILabel+Extention.m
//  Zhuan
//
//  Created by 张金山 on 17/6/26.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "UILabel+Extention.h"

@implementation UILabel (Extention)

+(UILabel*)labelWithRect:(CGRect)rect text:(NSString*)text font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor alignment:(NSTextAlignment)alignment textColor:(UIColor*)textColor{
    UILabel*label=[[UILabel alloc]initWithFrame:rect];
    if(text != nil){
        label.text = text;
    }
    if(backgroundColor != nil){
        label.backgroundColor = backgroundColor;
    }
    label.textAlignment = alignment;
    if(textColor != nil){
        label.textColor = textColor;
    }
    if(font != nil){
        label.font = font;
    }
    return label;
}

+(UILabel *)creatLabel:(void (^)(UILabel *))block{
    UILabel *label = [UILabel new];
    block(label);
    return label;
}

- (UILabel *(^)(float, float, float, float))ljFrame{
    return ^UILabel *(float left,float top,float width,float height){
        self.frame = CGRectMake(left, top, width, height);
        return self;
    };
}

- (UILabel *(^)(NSString *, UIFont *, UIColor *))ljTitle_font_textColor{
    return ^UILabel *(NSString *text, UIFont *font, UIColor *textColor){
        self.text = text;
        self.font = font;
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))ljAligment{
    return ^UILabel *(NSTextAlignment aligment){
        self.textAlignment = aligment;
        return self;
    };
}

- (UILabel *(^)(UIColor *))ljBackgroundColor{
    return ^UILabel *(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UILabel *(^)(NSInteger))ljNumberOfLines{
    return ^UILabel *(NSInteger lines){
        self.numberOfLines = lines;
        return self;
    };
}

@end

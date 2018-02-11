//
//  UIButton+Extention.m
//  Zhuan
//
//  Created by 张金山 on 17/6/26.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "UIButton+Extention.h"

@implementation UIButton (Extention)

+(UIButton *)buttonItemWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backGroundColor:(UIColor *)backGroundColor Font:(UIFont *)font cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth target:(id)target action:(SEL)action{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if(title != nil && ![title isEqualToString:@""]){
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(titleColor != nil){
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if(backGroundColor != nil){
        button.backgroundColor = backGroundColor;
    }
    if(font != nil){
        button.titleLabel.font = font;
    }
    button.layer.cornerRadius = cornerRadius;
    if(borderColor != nil){
        button.layer.borderColor = borderColor.CGColor;
    }
    button.layer.borderWidth = borderWidth;
    if(target !=nil && action != nil){
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return  button;
}

+ (UIButton *)creatButton:(void (^)(UIButton *))block{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    block(button);
    return button;
}

- (UIButton *(^)(float, float, float, float))ljFrame{
    return ^UIButton *(float left,float top,float width,float height){
        self.frame = CGRectMake(left, top, width, height);
        return self;
    };
}

- (UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))ljImageInsets{
    return ^UIButton *(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        self.imageEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return self;
    };
}

- (UIButton *(^)(CGFloat, CGFloat, CGFloat, CGFloat))ljTitleInsets{
    return ^UIButton *(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        self.titleEdgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIViewContentMode))ljImage_contentMode{
    return ^UIButton *(UIImage *image, UIViewContentMode mode){
        [self setImage:image forState:UIControlStateNormal];
        self.imageView.contentMode = mode;
        return self;
    };
}

- (UIButton *(^)(NSString *, UIFont *, UIColor *, UIControlState))ljTitle_font_titleColor_state{
    return ^UIButton *(NSString *title, UIFont *font, UIColor *textColor, UIControlState controlState){
        [self setTitle:title forState:controlState];
        [self setTitleColor:textColor forState:controlState];
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(NSAttributedString *, UIControlState))ljAttributedTitle_state{
    return ^UIButton *(NSAttributedString *title, UIControlState controlState){
        [self setAttributedTitle:title forState:controlState];
        return self;
    };
}

- (UIButton *(^)(UIControlContentHorizontalAlignment))ljHorizontalAlignment {
    return ^UIButton *(UIControlContentHorizontalAlignment alignment){
        [self setContentHorizontalAlignment:alignment];
        return self;
    };
}

- (UIButton *(^)(UIControlContentVerticalAlignment))ljVerticalAlignment {
    return ^UIButton *(UIControlContentVerticalAlignment alignment){
        [self setContentVerticalAlignment:alignment];
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))ljBackgroundImage_state{
    return ^UIButton *(UIImage *image, UIControlState controlState){
        [self setBackgroundImage:image forState:controlState];
        return self;
    };
}

- (UIButton *(^)(UIColor *))ljBackgroundColor{
    return ^UIButton *(UIColor *color){
        [self setBackgroundColor:color];
        return self;
    };
}

- (UIButton *(^)(id, SEL,UIControlEvents))ljTarget_action_events{
    return ^UIButton *(id target, SEL selector, UIControlEvents event){
        [self addTarget:target action:selector forControlEvents:event];
        return self;
    };
}

- (UIButton *(^)(CGFloat, CGFloat, UIColor *))ljCornerRadius_borderWidth_borderColor{
    return ^UIButton *(CGFloat radius, CGFloat width ,UIColor *color){
        self.layer.cornerRadius = radius;
        self.layer.borderWidth = width;
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIButton *(^)(BOOL))ljSelect{
    return ^UIButton *(BOOL select){
        self.selected = select;
        return self;
    };
}

@end

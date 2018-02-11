//
//  UIButton+Extention.h
//  Zhuan
//
//  Created by 张金山 on 17/6/26.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extention)

+(UIButton *)buttonItemWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backGroundColor:(UIColor *)backGroundColor Font:(UIFont *)font cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth target:(id)target action:(SEL)action;

+ (UIButton *)creatButton:(void(^)(UIButton *button))block;
/*
 * Button的frame
 */
//@property (nonatomic,copy) UIButton* (^ljFrame)(float left,float top,float width,float height);
- (UIButton* (^)(float left,float top,float width,float height))ljFrame;
/*
 * imageView的frame
 */
- (UIButton* (^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))ljImageInsets;
/*
 * title的frame”
 */
- (UIButton* (^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))ljTitleInsets;
/*
 * imageView的参数值
 */
- (UIButton* (^)(UIImage *image, UIViewContentMode mode))ljImage_contentMode;
/*
 * Title的参数值
 */
- (UIButton* (^)(NSString *title, UIFont *font, UIColor *textColor, UIControlState controlState))ljTitle_font_titleColor_state;
- (UIButton *(^)(NSAttributedString *title, UIControlState controlState))ljAttributedTitle_state;
- (UIButton *(^)(UIControlContentHorizontalAlignment alignment))ljHorizontalAlignment;
- (UIButton *(^)(UIControlContentVerticalAlignment alignment))ljVerticalAlignment;
/*
 * 背景图片
 */
- (UIButton* (^)(UIImage *image, UIControlState controlState))ljBackgroundImage_state;
/*
 * 背景颜色
 */
- (UIButton* (^)(UIColor *color))ljBackgroundColor;
/*
 * 点击事件类型
 */
- (UIButton* (^)(id target, SEL selector, UIControlEvents event))ljTarget_action_events;
/*
 * 圆角
 */
- (UIButton* (^)(CGFloat radius, CGFloat width ,UIColor *color))ljCornerRadius_borderWidth_borderColor;
/*
 *
 */
- (UIButton* (^)(BOOL select))ljSelect;


@end

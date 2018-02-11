//
//  UIBarButtonItem+ZJS_Extention.m
//  彩票
//
//  Created by mac on 16/2/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIBarButtonItem+Extention.h"

@implementation UIBarButtonItem (Extention)

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    if(title != nil && ![title isEqualToString:@""]){
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(normalImage != nil && ![normalImage isEqualToString:@""]){
      UIImage * image1 = [UIImage imageNamed:normalImage];
      [button setImage:[image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    if(selectImage != nil && ![selectImage isEqualToString:@""]){
      UIImage * image2 = [UIImage imageNamed:selectImage];
      [button setImage:[image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    }
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return  item;
}

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title size:(CGFloat)fontSize target:(id)target action:(SEL)action{
    
    UIBarButtonItem *BBI = [[UIBarButtonItem alloc]initWithTitle:title
                                                               style:UIBarButtonItemStylePlain
                                                              target:target
                                                              action:action];
    [BBI setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                      NSFontAttributeName:[UIFont fontWithName:@"iconfont" size:fontSize]}
                           forState:UIControlStateNormal];
    [BBI setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                  NSFontAttributeName:[UIFont fontWithName:@"iconfont" size:fontSize]}
                       forState:UIControlStateSelected];
    return BBI;
}

+(UIBarButtonItem *)barButtonItemV2WithTitle:(NSString *)title size:(CGFloat)fontSize target:(id)target action:(SEL)action andColor:(UIColor *)color{
    
    UIBarButtonItem *BBI = [[UIBarButtonItem alloc]initWithTitle:title
                                                           style:UIBarButtonItemStylePlain
                                                          target:target
                                                          action:action];
    [BBI setTitleTextAttributes:@{NSForegroundColorAttributeName:color,
                                  NSFontAttributeName:[UIFont fontWithName:@"iconfontv2" size:fontSize]}
                       forState:UIControlStateNormal];
    [BBI setTitleTextAttributes:@{NSForegroundColorAttributeName:color,
                                  NSFontAttributeName:[UIFont fontWithName:@"iconfontv2" size:fontSize]}
                       forState:UIControlStateSelected];
    return BBI;
}

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title size:(CGFloat)fontSize target:(id)target action:(SEL)action andColor:(UIColor *)color{
    
    UIBarButtonItem *BBI = [[UIBarButtonItem alloc]initWithTitle:title
                                                           style:UIBarButtonItemStylePlain
                                                          target:target
                                                          action:action];
    [BBI setTitleTextAttributes:@{NSForegroundColorAttributeName:color,
                                  NSFontAttributeName:[UIFont fontWithName:@"iconfont" size:fontSize]}
                       forState:UIControlStateNormal];
    [BBI setTitleTextAttributes:@{NSForegroundColorAttributeName:color,
                                  NSFontAttributeName:[UIFont fontWithName:@"iconfont" size:fontSize]}
                       forState:UIControlStateSelected];
    
    return BBI;
}

@end

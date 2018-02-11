//
//  UITabBar+badge.m
//  Zhuan
//
//  Created by 张金山 on 16/8/5.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import "UITabBar+Extention.h"

@implementation UITabBar (Extention)


- (void)showBadgeOnItemIndex:(int)index content:(NSString *)content{
    [self removeBadgeOnItemIndex:index];
    UILabel *badgeView = [[UILabel alloc]init];
    badgeView.tag = 888 + index;
    badgeView.text = content;
    
    int contNum = [content intValue];
    if(contNum <= 0){
        badgeView.hidden = YES;
    }else{
        badgeView.hidden = NO;
        if(contNum > 99){
            badgeView.text = @"99+";
            badgeView.font = [UIFont systemFontOfSize:8];
        }else{
            badgeView.text = content;
            badgeView.font = [UIFont systemFontOfSize:10];
        }
    }
    
    badgeView.textColor = [UIColor whiteColor];
    badgeView.textAlignment = NSTextAlignmentCenter;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;
    float percentX = (index + 0.6) / [UserInfoManager shareObject].nav.tabBarController.viewControllers.count;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 18, 18);
    badgeView.layer.cornerRadius = 9;
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];
}


- (void)hideBadgeOnItemIndex:(int)index{
    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(int)index{
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

@end

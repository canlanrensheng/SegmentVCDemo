//
//  UITabBar+badge.h
//  Zhuan
//
//  Created by 张金山 on 16/8/5.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Extention)

- (void)showBadgeOnItemIndex:(int)index content:(NSString *)content;

- (void)hideBadgeOnItemIndex:(int)index; 

@end

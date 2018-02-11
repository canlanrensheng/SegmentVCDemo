//
//  Header.h
//  SegmentVCDemo
//
//  Created by 张金山 on 2018/2/7.
//  Copyright © 2018年 张金山. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define IphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kNavBarHeight   (IphoneX ? 88 : 64)
#define kTabBarHeight (IphoneX ? 83 : 49)
//没有标签条的距离底部的距离
#define KBottomHeight (IphoneX ? 34 : 0)
#define Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Screen_Width       [[UIScreen mainScreen] bounds].size.width

#endif /* Header_h */

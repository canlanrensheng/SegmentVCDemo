//
//  UIViewController+Swizzling.m
//  Zhuan
//
//  Created by 张金山 on 17/9/26.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "UIViewController+Swizzling.h"

@implementation UIViewController (Swizzling)

#ifdef DEBUG
+ (void)load {
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method logViewWillAppear = class_getInstanceMethod(self, @selector(logViewWillAppear:));
    method_exchangeImplementations(viewWillAppear, logViewWillAppear);
}
#endif

- (void)logViewWillAppear:(BOOL)animated {
    NSString *className = NSStringFromClass([self class]);
    if ([className hasPrefix:@"UI"] == NO && [self isKindOfClass:[UIViewController class]] && [className hasPrefix:@"RT"] == NO && [className hasPrefix:@"Base"] == NO) {
        DLog(@"你当前看的控制器的名称是:%@ ",className);
    }
    [self logViewWillAppear:animated];
}


@end

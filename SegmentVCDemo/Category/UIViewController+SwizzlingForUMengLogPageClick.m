//
//  UIViewController+SwizzlingForUMengLogPageClick.m
//  Zhuan
//
//  Created by z on 2017/4/26.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "UIViewController+SwizzlingForUMengLogPageClick.h"
#import <UMMobClick/MobClick.h>
#import "RTRootNavigationController.h"
#import "CustomTabbarController.h"
#import "BaseNavigationViewController.h"
#import "BaseViewController.h"


static inline void
swizzling_exchangeMethod(Class clazz ,SEL originalSelector, SEL swizzledSelector){
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);
    BOOL success = class_addMethod(clazz, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(clazz, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIViewController (SwizzlingForUMengLogPageClick)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL viewWillAppearOriginalSelector = @selector(viewWillAppear:);
        SEL viewWillAppearSwizzleSelector  = @selector(zlc_viewWillAppear:);
        swizzling_exchangeMethod(self, viewWillAppearOriginalSelector,viewWillAppearSwizzleSelector);
        SEL viewWillDisappearOriginalSelector = @selector(viewWillDisappear:);
        SEL viewWillDisappearSwizzleSelector  = @selector(zlc_viewWillDisappear:);
        swizzling_exchangeMethod(self, viewWillDisappearOriginalSelector,viewWillDisappearSwizzleSelector);
    });
}

#pragma mark - Method Swizling
- (void)zlc_viewWillAppear:(BOOL)animated {
    [self zlc_viewWillAppear:animated];
    if  ([self donotNeedLogViewController]) return;
    [MobClick beginLogPageView:NSStringFromClass([self class])];
}

- (void)zlc_viewWillDisappear:(BOOL)animated {
    [self zlc_viewWillAppear:animated];
    if  ([self donotNeedLogViewController]) return;
    [MobClick endLogPageView:NSStringFromClass([self class])];
}

- (BOOL)donotNeedLogViewController {
    BOOL value = NO;
    if  ([self isKindOfClass:[RTContainerController class]]) {
        value = YES;
    }
    if  ([self isKindOfClass:[RTContainerNavigationController class]]) {
        value = YES;
    }
    if  ([self isKindOfClass:[CustomTabbarController class]]) {
        value = YES;
    }
    if  ([self isKindOfClass:[BaseNavigationViewController class]]) {
        value = YES;
    }
    
    if  ([self isKindOfClass:[BaseViewController class]]) {
        value = YES;
    }
    return value;
}

@end

//
//  NSObject+Dealloc.m
//  ZhuanMCH
//
//  Created by txooo on 17/4/5.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "NSObject+TXDealloc.h"
#import <objc/runtime.h>
@implementation UIViewController (TXDealloc)

#ifdef DEBUG
+ (void)load {
    Method txDealloc = class_getInstanceMethod(self, @selector(txDealloc));
    Method dealloc = class_getInstanceMethod(self,NSSelectorFromString(@"dealloc"));
    method_exchangeImplementations(txDealloc, dealloc);
}
#endif

- (void)txDealloc{
    DLog(@"%@---Dealloc",self);
    [self txDealloc];
}

@end

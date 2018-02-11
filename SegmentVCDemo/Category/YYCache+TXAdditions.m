//
//  YYCache+BMAdditions.m
//  BM
//
//  Created by txooo on 17/4/21.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "YYCache+TXAdditions.h"

@implementation YYCache (TXAdditions)

static YYCache *cache;

+ (instancetype)sharedCache {
    if(cache == nil){
        if([UserInfoManager shareObject].isLoginIn){
            NSString *userId = [[UserInfoManager shareObject] GetUserInfo][@"userId"];
            NSParameterAssert(userId.length > 0);
            cache = [YYCache cacheWithName:userId];
        }
    }
    return cache;
}

+ (void)deallocCache{
    cache = nil;
}

@end

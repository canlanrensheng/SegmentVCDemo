//
//  NSObject+Selector.h
//  Zhuan
//
//  Created by txooo on 16/8/18.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Selector)
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;
@end

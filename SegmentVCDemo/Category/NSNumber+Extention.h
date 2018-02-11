//
//  NSNumber+conform.h
//  Zhuan
//
//  Created by 张金山 on 17/3/24.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Extention)

//转换数字,小数为为零取整,否则保留两位
- (NSString *)conversionFormat;

@end

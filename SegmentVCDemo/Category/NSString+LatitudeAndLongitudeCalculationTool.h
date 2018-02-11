//
//  NSString+LatitudeAndLongitudeCalculationTool.h
//  Zhuan
//
//  Created by z on 2017/9/21.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LatitudeAndLongitudeCalculationTool)

/// <= 999 单位m, > 999 单位 km
+ (NSString * )calculateDistanceWithLatitude1:(CGFloat)lat1
                                   longitude1:(CGFloat)lng1
                                    latitude2:(CGFloat)lat2
                                   longitude2:(CGFloat)lng2;
@end

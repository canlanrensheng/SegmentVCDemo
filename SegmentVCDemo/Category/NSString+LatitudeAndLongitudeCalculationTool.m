//
//  NSString+LatitudeAndLongitudeCalculationTool.m
//  Zhuan
//
//  Created by z on 2017/9/21.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "NSString+LatitudeAndLongitudeCalculationTool.h"

@implementation NSString (LatitudeAndLongitudeCalculationTool)

+ (NSString * )calculateDistanceWithLatitude1:(double)lat1
                                  longitude1:(double)lng1
                                   latitude2:(double)lat2
                                  longitude2:(double)lng2 {
    CLLocation *orig = [[CLLocation alloc] initWithLatitude:lat1  longitude:lng1];
    CLLocation* dist = [[CLLocation alloc] initWithLatitude:lat2 longitude:lng2];
    CLLocationDistance meters = [orig distanceFromLocation:dist];
    
    NSString *locationStr = nil;
    if (meters < 999) {
        locationStr = [NSString stringWithFormat:@"%.2fm",meters];
    } else {
        locationStr = [NSString stringWithFormat:@"%.2fkm",meters/1000.0];
    }
    return locationStr;
}

@end

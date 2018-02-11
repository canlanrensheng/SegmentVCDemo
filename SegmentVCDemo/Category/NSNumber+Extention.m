//
//  NSNumber+conform.m
//  Zhuan
//
//  Created by 张金山 on 17/3/24.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "NSNumber+Extention.h"

@implementation NSNumber (Extention)

- (NSString *)conversionFormat{
    float floatValueNum = [self floatValue];
    int intValueNum = (int)floatValueNum;
    if(intValueNum  > 10000){
        float num = (float)intValueNum /10000;
        NSString * newStr = [NSString stringWithFormat:@"%.1f万",num];
        return newStr;
    }else{
        NSString * valueNumStr = nil;
        if(floatValueNum == intValueNum){
            valueNumStr =[NSString stringWithFormat:@"%d",intValueNum];
        }else{
            valueNumStr =[NSString stringWithFormat:@"%.2f",floatValueNum];
        }
        return valueNumStr;
    }
}

@end

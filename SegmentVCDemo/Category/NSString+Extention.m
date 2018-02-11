//
//  NSString+CalCulateSize.m
//  Zhuan
//
//  Created by txooo on 16/5/24.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import "NSString+Extention.h"

@implementation NSString (Extention)

//计算行高 并设置行间距
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font spacing:(CGFloat)spacing{
    CGSize expectedLabelSize = CGSizeZero;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

//计算行高 有行间距默认5
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font {
    CGSize expectedLabelSize = CGSizeZero;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

//计算行高 没有行间距
- (CGSize)calculateNoHangJuSize:(CGSize)size font:(UIFont *)font {
    CGSize expectedLabelSize = CGSizeZero;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

//计算宽度
- (CGFloat)calculateWidthWithSize:(CGSize)size font:(UIFont *)font{
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

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

//富文本
-(NSAttributedString *)fuWenBenWithStr:(NSString * )str withColor:(UIColor *)color withFont:(UIFont *)font
{
    NSRange range = [self rangeOfString:str];
    NSMutableAttributedString * newStr = [[NSMutableAttributedString alloc] initWithString:self];
    [newStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [newStr addAttribute:NSFontAttributeName value:font range:range];
    //[newStr addAttribute: NSLinkAttributeName value: [NSURL URLWithString:[NSString stringWithFormat:@"%@",[arr objectAtIndex:index]]] range:range];
    return  newStr;
}

-(NSAttributedString *)fuWenBenWithStr:(NSString * )str withColor:(UIColor *)color withFont:(UIFont *)font space:(CGFloat)space
{
    NSRange range = [self rangeOfString:str];
    NSMutableAttributedString * newStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [newStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    
    [newStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [newStr addAttribute:NSFontAttributeName value:font range:range];
    //[newStr addAttribute: NSLinkAttributeName value: [NSURL URLWithString:[NSString stringWithFormat:@"%@",[arr objectAtIndex:index]]] range:range];
    return  newStr;

}

-(NSString *)replaceUnicode{
    
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

-(NSString *)timeTransform{
    NSArray * firstArr = [self componentsSeparatedByString:@" "];
    NSString * firstStr = [firstArr firstObject];
    NSArray * secondArr = [firstStr componentsSeparatedByString:@"/"];
    return [NSString stringWithFormat:@"%@-%@-%@ %@",[secondArr lastObject],[secondArr firstObject],secondArr[1],[firstArr lastObject]];
}

+ (NSString *)encodeToPercentEscapeString: (NSString *) input{
    
    NSString *outputStr =
    
    (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                 
                                                                 NULL, /* allocator */
                                                                 
                                                                 (__bridge CFStringRef)input,
                                                                 
                                                                 NULL, /* charactersToLeaveUnescaped */
                                                                 
                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                 
                                                                 kCFStringEncodingUTF8);
    
    return outputStr;
    
}

+ (NSString *)decodeFromPercentEscapeString: (NSString *) input{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    
    [outputStr replaceOccurrencesOfString:@"+"
     
                               withString:@""
     
                                  options:NSLiteralSearch
     
                                    range:NSMakeRange(0,[outputStr length])];
    
    return
    
    [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}

-(NSString *)dealNullString{
    NSString * string = nil;
    if ([self isEqual:[NSNull null]] ||([self isEqualToString:@"null"]) || ([self isEqualToString:@"(null)"]) || ([self isEqualToString:@"<null>"])) {
        string = @"";
    }else{
        string = self;
    }
    return string;
}

- (BOOL)validateMobile{
    if (self.length != 11){
        return NO;
    }
    NSString *MOBILE = @"^^[1][3,4,5,7,8,9][0-9]{9}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:self];
}

//校验银行卡号
- (BOOL) validateBankCard{
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[self length];
    int lastNum = [[self substringFromIndex:cardNoLength-1] intValue];
    NSString * cardNo = [self substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    allsum = oddsum + evensum;
    allsum += lastNum;
    return (allsum % 10) == 0 ? YES : NO;
}

//校验银行卡
- (BOOL)validateIdentityCard{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

- (NSString *)addUrlImgScalePropertyWithUrlIconScaleType:(UrlIconScaleType)UrlIconScaleType{
    switch (UrlIconScaleType) {
        case UrlIconScaleTypeFullScreen:
            return [NSString stringWithFormat:@"%@,1,480,480,3",self];
            break;
        case UrlIconScaleTypeHalfScreen:
            return [NSString stringWithFormat:@"%@,1,250,250,3",self];
            break;
        
        case UrlIconScaleTypeIconScreen:
            return [NSString stringWithFormat:@"%@,1,80,80,3",self];
            break;
        case UrlIconScaleTypeOriginalScreen:
            return self;
            break;
    }
}

- (void)setLineSpacingWithLabel:(UILabel *)label space:(CGFloat)space{
    NSMutableAttributedString * attributedString =  [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    [label setAttributedText:attributedString];
    [label sizeToFit];
}

//同时校验手机号码和手机号码
- (BOOL)validateTelOrPhoneNum{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,177,180,189
     22         */
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if(([regextestmobile evaluateWithObject:self] == YES)
       || ([regextestcm evaluateWithObject:self] == YES)
       || ([regextestct evaluateWithObject:self] == YES)
       || ([regextestcu evaluateWithObject:self] == YES)
       || ([regextestPHS evaluateWithObject:self] == YES)){
        return YES;
    }else{
        return NO;
    }
}



- (NSString *)getPhoneNumString{
    NSError *error;
    NSString *regulaStr = @"((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray * arrayOfAllMatches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        NSString * substringForMatch = [self substringWithRange:match.range];
        return substringForMatch;
    }
    return @"";
}


/**
 * 网址正则验证 1或者2使用哪个都可以
 *
 *  @return 返回值类型为BOOL
 */
- (BOOL)validateUrl{
    NSError *error;
    // 正则1 必须带http
    //    NSString *regulaStr =@"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    // 正则2
    NSString *regulaStr =@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        if ([self substringWithRange:match.range]) {
            return YES;
        }
    }
    return NO;
}


//是否是测试号段
- (BOOL)isValidateTestPhone{
    UserInfoSingleObject *userInfoModel= [[UserInfoSingleObject sharedUserInfoSingle] getUserInfoModel];
    NSString * showPhone = userInfoModel.show_phone;
    if([[showPhone dealNullString] length] > 0){
        DLog(@"获取到的测试号段数据是:%@",[showPhone substringToIndex:6]);
        if([[showPhone substringToIndex:6] isEqualToString:@"177444"] || [[showPhone substringToIndex:6] isEqualToString:@"199999"]){
            return YES;
        }
        return NO;
    }
    return NO;
}

@end

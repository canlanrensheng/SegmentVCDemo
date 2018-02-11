//
//  NSString+CalCulateSize.h
//  Zhuan
//
//  Created by txooo on 16/5/24.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UrlIconScaleType) {
    UrlIconScaleTypeFullScreen = 1,//图片以宽度占满全屏的：在原URL的后面加上   ,1,480,480,3
    UrlIconScaleTypeHalfScreen,//其余：在原URL的后面加上   ,1,250,250,3
    UrlIconScaleTypeIconScreen,//头像：在原URL的后面加上   ,1,80,80,3
    UrlIconScaleTypeOriginalScreen
};

@interface NSString (Extention)
//计算字符串size
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font spacing:(CGFloat)spacing;
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font;
- (CGSize)calculateNoHangJuSize:(CGSize)size font:(UIFont *)font;
//转换数字,小数为为零取整,否则保留两位
- (NSString *)conversionFormat;
//富文本操作
-(NSAttributedString *)fuWenBenWithStr:(NSString * )str withColor:(UIColor *)color withFont:(UIFont *)font;
-(NSAttributedString *)fuWenBenWithStr:(NSString * )str withColor:(UIColor *)color withFont:(UIFont *)font space:(CGFloat)space;

-(NSString *)replaceUnicode;
-(NSString *)timeTransform;
//unicode编码
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;
//Unicode解码
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;
-(NSString *)dealNullString;

//匹配手机号码的正则表达式
- (BOOL)validateMobile;
//匹配身份证号
- (BOOL)validateIdentityCard;
//匹配银行卡号
- (BOOL)validateBankCard;
//判断是不是网址的表达式
- (BOOL)validateUrl;

- (NSString *)addUrlImgScalePropertyWithUrlIconScaleType:(UrlIconScaleType)UrlIconScaleType;

//设置行间距
- (void)setLineSpacingWithLabel:(UILabel *)label space:(CGFloat)space;

- (BOOL)validateTelOrPhoneNum;

//获取一段字符串中的电话号码
- (NSString *)getPhoneNumString;

//是否是测试号段
- (BOOL)isValidateTestPhone;

@end

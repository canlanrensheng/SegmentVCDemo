//
//  UIImage+Extention.h
//  Zhuan
//
//  Created by 张金山 on 17/6/10.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extention)

//  修改图片的大小
+ (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize;
//  将颜色转换成图片
+ (UIImage*)imageWithColor:(UIColor*) color;
//  通过url得到图片
+ (UIImage *)getImageFromURL:(NSString *)imageURL;
//  获取url中图片的大小
+ (CGSize)getImageSizeWithURL:(id)imageURL;
//  获取png图片的大小
+ (CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request;
//  获取gif图片的大小
+ (CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request;
//  获取jpg图片的大小
+ (CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request;
//  添加圆角
+ (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius usingImage:(UIImage *)original;

+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;
//图片旋转
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

@end

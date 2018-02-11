//
//  UIImageView+MyImageView.h
//  Zhuan
//
//  Created by txooo on 16/3/18.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MyImageView)

- (void)loadImageUrlStr:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius;

@end

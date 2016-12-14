//
//  UIImage+Image.h
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 生成一张对应颜色的图片

 @param color 颜色
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end

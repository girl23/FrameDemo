//
//  SFCTools.h
//  SinaFreshCity
//
//  Created by HuangYong on 14-8-14.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCTools : NSObject

/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;

/**
 @method 获取指定字体大小，字符串value的长度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @result float 返回的长度
 */
+ (float) widthForString:(NSString *)value fontSize:(float)fontSize;
//截取屏幕
+ (UIImage*)screenshot;

//获取图片只能用于png
+(UIImage*)imageNamed:(NSString*)named;

+(UIImageView*)seperatorHline:(CGFloat)height color:(UIColor*)color image:(UIImage*)image;

+(UIImageView*)seperatorVline:(CGFloat)width color:(UIColor*)color image:(UIImage*)image;

@end

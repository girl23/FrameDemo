//
//  SFCTools.m
//  SinaFreshCity
//
//  Created by HuangYong on 14-8-14.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import "MCTools.h"

@implementation MCTools

/**
 @method 获取指定宽度情况ixa，字符串value的高度
 */
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    if (!value) {
        return 0.0f;
    }
    
//    if( [[UIDevice currentDevice].systemVersion floatValue] >= 8.0f )
//    {
//        CGRect rectToFit = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)  options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
//        return rectToFit.size.height;
//    }
//    else
//    {
        CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
        return sizeToFit.height+1;//不加1 ios 8要报错
//    }
}

/**
 @method 获取指定字符串value的长度
 */
+ (float) widthForString:(NSString *)value fontSize:(float)fontSize
{
    if (!value) {
        return 0.0f;
    }
    
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    
    return sizeToFit.height;
}

//截取屏幕
+ (UIImage*)screenshot
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Iterate over every window from back to front
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
        {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            // Offset by the portion of the bounds left of and above the anchor point
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            
            // Restore the context
            CGContextRestoreGState(context);
        }
    }
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

//获取图片只能用于png
+(UIImage*)imageNamed:(NSString*)named
{
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",named ] ofType:@".png" inDirectory:@""];
    UIImage *tmpImage = [[UIImage alloc]initWithContentsOfFile:path];
    return tmpImage;
}

+(UIImageView*)seperatorHline:(CGFloat)height color:(UIColor*)color image:(UIImage*)image
{
    UIImageView* line = [[UIImageView alloc]init];
    line.backgroundColor = color;
    line.width = MC_SCREEN_WIDTH;
    line.height = height;
    if (image) {
        line.image = image;
    }
    return line;
}

+(UIImageView*)seperatorVline:(CGFloat)width color:(UIColor*)color image:(UIImage*)image
{
    UIImageView* line = [[UIImageView alloc]init];
    line.backgroundColor = color;
    line.width = width;
    line.height = MC_SCREEN_HEIGHT;
    if (image) {
        line.image = image;
    }
    return line;
}

@end

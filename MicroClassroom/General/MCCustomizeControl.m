//
//  SFCCustomizeControl.m
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-8-14.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import "MCCustomizeControl.h"

@implementation MCCustomizeControl

+(UILabel*)customizeLabel:(NSString*)text backgroundColor:(UIColor*)backgroundColor font:(UIFont*)font textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = backgroundColor;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.lineBreakMode = lineBreakMode;
    label.text = text;
    [label sizeToFit];
    
    return label;
}

@end

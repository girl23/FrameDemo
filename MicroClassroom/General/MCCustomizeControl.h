//
//  SFCCustomizeControl.h
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-8-14.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCCustomizeControl : NSObject

+(UILabel*)customizeLabel:(NSString*)text backgroundColor:(UIColor*)backgroundColor font:(UIFont*)font textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end

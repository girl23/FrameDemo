//
//  MCBaiduSetMode.h
//  MicroClassroom
//
//  Created by wdwk on 2016/12/13.
//  Copyright © 2016年 FeiGuangpu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCBaiduSetMode : NSObject
//关于百度播放器的数据；
@property(nonatomic, strong)NSString*ak;
@property(nonatomic, strong)NSString*appid;
@property(nonatomic, strong)NSString* bucket;
@property(nonatomic, strong)NSString*sk;
-(id)initWithDictionary:(NSDictionary*)dictionary;
@end

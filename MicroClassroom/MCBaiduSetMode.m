//
//  MCBaiduSetMode.m
//  MicroClassroom
//
//  Created by wdwk on 2016/12/13.
//  Copyright © 2016年 FeiGuangpu. All rights reserved.
//

#import "MCBaiduSetMode.h"

@implementation MCBaiduSetMode
-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    
    if (self) {
            self.ak = [dictionary valueForKey:@"ak"];
            self.appid= [dictionary valueForKey:@"appid"];
            self.bucket=[dictionary valueForKey:@"bucket"];
            self.sk=[dictionary valueForKey:@"sk"];
          }
    return self;

}
@end

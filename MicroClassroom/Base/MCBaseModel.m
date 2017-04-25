//
//  SFCBaseModel.m
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-8-26.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import "MCBaseModel.h"

@implementation MCBaseModel

- (void)dealloc
{
    [self cancel];
}

-(void)cancel
{
    if (self.operation != nil) {
        
        NSThread * thread=[NSThread currentThread];
        BOOL ismain=[thread isMainThread];
        if (!ismain) {
                  NSLog(@"主线程%d",ismain);
                   assert(NO);
        }
        
        [self.operation cancel];
          //置空
        self.operation = nil;
    }
}

@end

//
//  MCSubject.m
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-2-1.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCSubject.h"

@implementation MCSubject

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self) {
        self.subjectId = [dictionary valueForKey:@"id"];
        self.subjectName = [dictionary valueForKey:@"name"];
    }
    
    return self;
}

@end

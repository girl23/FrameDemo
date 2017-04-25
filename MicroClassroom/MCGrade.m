//
//  MCGrade.m
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-2-1.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCGrade.h"
#import "MCSubject.h"

@implementation MCGrade
-(id)init
{
    self = [super init];
    
    if (self) {
        self.subjectArray = [[NSMutableArray alloc]init];
        
        MCSubject* subject = [[MCSubject alloc]init];
        subject.subjectId = @"0";
        subject.subjectName = @"全部科目";
        [self.subjectArray insertObject:subject atIndex:0];
    }
    
    return self;
}

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    
    if (self) {
//        self.subjectArray = [[NSMutableArray alloc]init];
        self.gradeId = [dictionary valueForKey:@"id"];
        self.gradeName = [dictionary valueForKey:@"name"];
        
        NSArray* array = [dictionary objectForKey:@"course"];
        for (NSDictionary* dic in array) {
            MCSubject *subject = [[MCSubject alloc]initWithDictionary:dic];
            [self.subjectArray addObject:subject];
        }
    }
    
    return self;
}
@end

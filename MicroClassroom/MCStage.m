//
//  MCStage.m
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-2-1.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCStage.h"
#import "MCGrade.h"

@implementation MCStage

-(id)init
{
    self = [super init];
    
    if (self) {
        self.gradeArray = [[NSMutableArray alloc]init];
        
        MCGrade* grade = [[MCGrade alloc]init];
        grade.gradeId = @"0";
        grade.gradeName = @"全部年级";
        [self.gradeArray insertObject:grade atIndex:0];
    }
    
    return self;
}

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    
    if (self) {
//        self.gradeArray = [[NSMutableArray alloc]init];
        
        self.stageId = [dictionary valueForKey:@"id"];
        self.stageName = [dictionary valueForKey:@"name"];
        
        NSArray* array = [dictionary objectForKey:@"xueji"];
        for (NSDictionary* dic in array) {
            MCGrade *grade = [[MCGrade alloc]initWithDictionary:dic];
            [self.gradeArray addObject:grade];
        }
    }
    
    return self;
}

@end

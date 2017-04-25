//
//  MCGrade.h
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-2-1.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBaseModel.h"

@interface MCGrade : MCBaseModel
@property(nonatomic, strong)NSString* gradeId;
@property(nonatomic, strong)NSString* gradeName;
@property(nonatomic, strong)NSMutableArray* subjectArray;

-(id)initWithDictionary:(NSDictionary*)dictionary;
@end

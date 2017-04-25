//
//  MCStage.h
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-2-1.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBaseModel.h"

@interface MCStage : MCBaseModel
@property(nonatomic, strong)NSString* stageId;
@property(nonatomic, strong)NSString* stageName;
@property(nonatomic, strong)NSMutableArray* gradeArray;

-(id)initWithDictionary:(NSDictionary*)dictionary;
@end

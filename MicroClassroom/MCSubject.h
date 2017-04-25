//
//  MCSubject.h
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-2-1.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBaseModel.h"

@interface MCSubject : MCBaseModel
@property(nonatomic, strong)NSString* subjectId;
@property(nonatomic, strong)NSString* subjectName;

-(id)initWithDictionary:(NSDictionary*)dictionary;
@end

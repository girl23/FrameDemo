//
//  MCBasicDataManager.h
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-1-20.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBaseModel.h"
#import "MCBasicData.h"

@interface MCBasicDataManager : MCBaseModel

@property(nonatomic, strong) MCBasicData* basicData;

@property(nonatomic)BOOL succeed;
@property(strong, nonatomic)NSError         *error;     //错误信息

+(MCBasicDataManager*)shareInstance;
-(void)fetchBasicData;

@end

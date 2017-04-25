//
//  MCBasicData.h
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-1-20.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBaseModel.h"
#import "MCBaiduSetMode.h"
@interface MCBasicData : MCBaseModel

@property(nonatomic, strong)NSString* cour_pix_pre;
@property(nonatomic, strong)NSString* less_pix_pre;
@property(nonatomic, strong)NSString* less_video_play;
@property(nonatomic, strong)NSString* less_video_pre;
@property(nonatomic, strong)NSString* less_file_pre;
@property(nonatomic, strong)NSString* ques_pre;
@property(nonatomic, strong)NSString* ques_answer_pre;
@property(nonatomic, strong)NSString* ad_pre;
@property(nonatomic, strong)NSString* point_pre;
@property(nonatomic, strong)NSString* store_logo;
@property(nonatomic, strong)NSString* service_agreement_url;
@property(nonatomic, strong)NSString* share_url ;
@property(nonatomic, strong)NSString* store_video_play;
@property(nonatomic, strong)NSString* less_video_startAndEnd;

@property(nonatomic, strong)NSMutableArray* stageArray;
@property(nonatomic,strong)MCBaiduSetMode * baidumodel;
-(id)initWithDictionary:(NSDictionary*)dictionary;

@end

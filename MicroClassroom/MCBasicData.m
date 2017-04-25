//
//  MCBasicData.m
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-1-20.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBasicData.h"
#import "MCStage.h"
#import "MCGrade.h"
#import "MCSubject.h"

@implementation MCBasicData

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self) {
               
        self.cour_pix_pre = [dictionary valueForKey:@"cour_pix_pre"];
        self.less_pix_pre = [dictionary valueForKey:@"less_pix_pre"];
        self.less_video_pre = [dictionary valueForKey:@"less_video_pre"];
        self.less_video_play = dictionary[@"less_video_play"];
        self.less_file_pre = [dictionary valueForKey:@"less_file_pre"];
        self.ques_pre = [dictionary valueForKey:@"ques_pre"];
        self.ques_answer_pre = [dictionary valueForKey:@"ques_answer_pre"];
        self.ad_pre = [dictionary valueForKey:@"ad_pre"];
        self.point_pre = [dictionary valueForKey:@"point_pre"];
        self.store_logo = [dictionary valueForKey:@"store_logo"];
        self.service_agreement_url=[dictionary valueForKey:@"service_agreement_url"];
        self.share_url=[dictionary valueForKey:@"share_url"];
        self.store_video_play=[dictionary valueForKey:@"store_video_play"];
        self.less_video_startAndEnd=[dictionary valueForKey:@"less_video_startAndEnd"];


        //解析课程分类
        if (self.stageArray == nil) {
            
            self.stageArray = [[NSMutableArray alloc]init];
        }
        else{
            [self.stageArray removeAllObjects];
        }
        
        NSDictionary* dic = [dictionary objectForKey:@"cour_schema"];
        //此处有崩溃,添加count判断
        if (dic.count>0) {
            
            NSArray* array = [dic objectForKey:@"xueduan"];
            
            for (NSDictionary* dictionary in array) {
                
                MCStage* stage = [[MCStage alloc]initWithDictionary:dictionary];
                
                [self.stageArray addObject:stage];
            }

        }
        
        [self reBuildStageArr];
        //百度播放器的基础数据；
        NSDictionary * baiduSetDic=[dictionary objectForKey:@"baidu_play_set"];
        
        if (baiduSetDic.count>0) {
            MCBaiduSetMode * bdmodel=[[MCBaiduSetMode alloc]initWithDictionary:baiduSetDic];
            self.baidumodel=bdmodel;
            
        }
        
    }
    
    return self;
}

-(void)reBuildStageArr
{
    MCStage* stage = [[MCStage alloc]init];
    stage.stageId = @"0";
    stage.stageName = @"全部学段";

    [self.stageArray insertObject:stage atIndex:0];
}


@end

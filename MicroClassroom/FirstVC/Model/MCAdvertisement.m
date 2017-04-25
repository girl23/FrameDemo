//
//  MCAdvertisement.m
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-1-29.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCAdvertisement.h"

@implementation MCAdvertisement
-(id)initWithDictionary:(NSDictionary*)dictioanry
{
    self = [super init];
    if (dictioanry.count>0) {
        
        if (self && dictioanry) {
            self.pix_id = [dictioanry valueForKey:@"pix_id"];
            self.type = [dictioanry valueForKey:@"type"];
            self.url = [dictioanry valueForKey:@"url"];
            self.taget_id = [dictioanry valueForKey:@"taget_id"];
            self.ad_title = [dictioanry valueForKey:@"ad_title"];
            //此处有闪退；加入数据判断
            if ([self.type isEqualToString:@"1"]) {
                self.adType = ECourseAD;
            }else if ([self.type isEqualToString:@"2"]){
                self.adType = EWebsiteAD;
            }else if ([self.type isEqualToString:@"3"]){
                self.adType = ESchoolAd;
            }
        }

    }
    
    return self;
}
-(NSString *)pictureUrl
{
    NSString * preUrl= [MCBasicDataManager shareInstance].basicData.ad_pre;
    
    return  [NSString stringWithFormat:@"%@%@", preUrl,self.pix_id];
}
@end

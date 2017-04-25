//
//  MCAdvertisement.h
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-1-29.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBaseModel.h"

typedef enum
{
    EUnkonwn = 0,
    ECourseAD,
    EWebsiteAD,
    ESchoolAd,
}MCAdvertisementType;

@interface MCAdvertisement : MCBaseModel
@property(nonatomic, strong)NSString* pix_id;
@property(nonatomic, strong)NSString* type;
@property(nonatomic, strong)NSString* url;
@property(nonatomic, strong)NSString* taget_id;
@property(nonatomic, strong)NSString* ad_title;
@property(nonatomic)MCAdvertisementType adType;

@property(nonatomic, strong)NSString *pictureUrl;
-(id)initWithDictionary:(NSDictionary*)dictioanry;
@end

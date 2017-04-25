//
//  MCBasicDataManager.m
//  MicroClassroom
//
//  Created by FeiGuangpu on 15-1-20.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "MCBasicDataManager.h"
#import "MCNetworkEngine.h"

@implementation MCBasicDataManager

+(MCBasicDataManager*)shareInstance{
    
    static MCBasicDataManager *model;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        model = [[MCBasicDataManager alloc] init];
    });
    
    return model;
}

-(id)init
{
    self = [super init];
    
    if (self) {
        self.basicData = [[MCBasicData alloc]initWithDictionary:nil];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self fetchBasicData];
//        });
    }
    
    return self;
}

-(void)dealloc
{
    
}

-(void)fetchBasicData
{
    self.succeed = NO;
    [super cancel];
    //网络获取
    MCNetworkEngine *networkEngine = [MCNetworkEngine defaultEngine];
    __weak __typeof(self) weakSelf = self;
    
   super.operation = [networkEngine getFaoundationDateWithCallback:^(id resp, NSError *error)
                  {
                      
                      if (error == nil)
                      {
                          NSDictionary *dicData = [resp isKindOfClass:[NSDictionary class]]?(NSDictionary*)resp:nil;
                          if (dicData && [dicData count] > 0)
                          {
                              if ([[dicData valueForKey:@"code"] integerValue] == 0)
                              {
                                  if (weakSelf.basicData) {
                                      weakSelf.basicData = nil;
                                  }
                                  
                                  weakSelf.basicData = [[MCBasicData alloc]initWithDictionary:dicData];
                                  [[NSNotificationCenter defaultCenter] postNotificationName:@"resetADImage" object:nil userInfo:nil];
                                  self.succeed = YES;
                              }
                              else
                              {
                                  NSString *errorMessage = @"获取基础数据失败，请重试！";
                                  
                                  if (dicData && dicData[@"msg"]) {
                                      errorMessage = dicData[@"msg"];
                                  }
                                  
                                  weakSelf.error = [NSError errorWithDomain:@"unknown"
                                                                       code:-1
                                                                   userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
                              }
                          }
                      }
                      else
                      {
//                          NSString *errorMessage = @"获取基础数据失败，请重试！";
//                          if ([error code] == KNoNetWorkErrorCode)
//                          {
//                              errorMessage = @"网络已断开，请检查您的网络连接！";
//                              [SVProgressHUD showErrorWithStatus:@"网络已断开，请检查您的网络连接！"];
//                          }
//                          weakSelf.error = [NSError errorWithDomain:@"unknown"
//                                                               code:[error code]
//                                                           userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
                      }
                  }];
}

@end

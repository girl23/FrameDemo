//
//  SFCFCNetworkEngine.m
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-8-7.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import "MCNetworkEngine.h"
#import "SW_OpenUDID.h"
#import "MCUserInfoManager.h"

static id sharedInstance=nil;
@implementation MCNetworkEngine

+ (instancetype)defaultEngine
{
    @synchronized(self) {
        
        if (!sharedInstance) {
            
            NSURL *defaultURL = [NSURL URLWithString:KFS_SERVER_ADDRESS];//[NSURL URLWithString:[self defaultURLString]];
            NSString *hostName  = [defaultURL host];
            NSString * port=[NSString stringWithFormat:@"%@",[defaultURL port]];//[defaultURL port];
            
            if (![port isEqualToString:@"(null)"]) {
                hostName=[NSString stringWithFormat:@"%@:%@",hostName,port];
            }
            NSString * apiPath = [defaultURL path];
            
            NSDictionary *header = @{@"Accept-Encoding": @"gzip, deflate"};
            sharedInstance = [[self alloc]initWithHostName:hostName apiPath:apiPath customHeaderFields:header];
            
        }
        return sharedInstance;
    }
}

-(SANetworkOperation*) operationWithPath1:(NSString*) path
                                  params:(NSMutableDictionary *)params
                              httpMethod:(NSString*)method
{
    //如果参数为空；重构参数；
    if (!params)params=[[NSMutableDictionary alloc] init];
    
    [self buildParam:params path:path];
    
    NSString *urlString = [NSString stringWithFormat:@"http://%@%@%@", self.readonlyHostName, self.apiPath, path];
    
    SANetworkOperation *op = nil;
    if ([method isEqualToString:@"POSTT"]) {
        //以json数据的形式上传数据；
        op=(SANetworkOperation *)[self operationWithURLString:urlString params:params httpMethod:@"POST"];
        
        op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
    }
    else{
        //获取数据；
        op=(SANetworkOperation *)[self operationWithURLString:urlString params:params httpMethod:method];
    }
    op.freezable = YES;
    NSLog(@"网络请求: %@",op);
    return op;
}
//可设置是POST还是GET
- (SANetworkOperation *)_enqueuOperationWithPath:(NSString *)path
                                          params:(NSMutableDictionary *)params
                                      httpMethod:(NSString*)method
                                        callback:(SFCFCNetworkEngineCallback)callback
{
    SANetworkOperation *op =(SANetworkOperation*) [self operationWithPath1:path
                                              params:params
                                          httpMethod:method];
    
    if (callback) {
        //指定请求代码块
        [op addCompletionHandler:^(SANetworkOperation *completedOperation) {
            
            if(callback == nil)
                return;
            
            NSString *result = [[NSString alloc] initWithData:completedOperation.responseData  encoding:NSUTF8StringEncoding];
            
            result = [result stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
          
            result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
            result = [result stringByReplacingOccurrencesOfString:@"\t" withString:@""];
            
         //礼品兑换我要兑换礼品介绍
//            result = [result stringByReplacingOccurrencesOfString:@"\\" withString:@""];
            //str---json
            NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *parseError = nil;
            //
            id json = [NSJSONSerialization JSONObjectWithData:data
                                                      options:NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments
                                                        error:&parseError];
            
            if (parseError) {
                //错误返回错误信息；
                callback(completedOperation.responseString, parseError);
            }
            
            else {
                //无错，调用block函数；
                callback(json, nil);
            }
            
        } errorHandler:^(SANetworkOperation *completedOperation, NSError *error) {
            callback(completedOperation.responseString, error);
            
        }];
    }
    //发起网络请求
    [self enqueueOperation:op];
    return op;
}
//需要自定义默认参数请复写此方法
- (void)buildParam:(NSMutableDictionary *)params path:(NSString *)path{
    //添加版本和平台信息
    if ([path isEqualToString:@"/post/feedback.php"] || [path isEqualToString:@"/post/login.php"]) {
        return;
    }
    
//    params[@"platform"] = @"IOS";
//    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
//    NSString* softversion = [infoPlist objectForKey:@"CFBundleVersion"];
//    params[@"version"] = softversion;
    
    
    if ([MCUserInfoManager shareManager].accessToken) {
        
        params[@"user"] = [MCUserInfoManager shareManager].accessToken;
        
    }
    else{
        //3.29/post/watch.php?action=add_watch    参数user  如果是未登录的情况下  进行观看  这个值就传 0；判断处理；
        if ([path isEqualToString:@"/post/watch.php"]) {
            
            params[@"user"]=@"0";
            
        }
        else
        {

            params[@"user"] = @"";
        }
   
    }
    
    
//    params[@"user"] = @"41b2519c3399749df986ce92244e288f";
}


#pragma mark -- action methed

/*
 *	@brief	2.1	基础数据接口
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getFaoundationDateWithCallback:(SFCFCNetworkEngineCallback)callback{
    
    NSMutableDictionary *params = [@{@"action" : @""} mutableCopy];
    
    return [self _enqueuOperationWithPath:@"/init.php"
                                   params:params httpMethod:@"GET"
                                 callback:callback];
}

/*
 *	@brief	2.2.1	首页广告
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getHomeAdWithCallback:(SFCFCNetworkEngineCallback)callback{
    NSMutableDictionary *params = [@{@"action" : @"adinfo"} mutableCopy];
    return [self _enqueuOperationWithPath:@"/home.php"
                                   params:params httpMethod:@"GET"
                                 callback:callback];

}

@end

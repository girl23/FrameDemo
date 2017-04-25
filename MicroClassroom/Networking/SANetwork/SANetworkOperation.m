//
//  SANetworkOperation.m
//  MicroClassroom
//
//  Created by wdwk on 16/4/19.
//  Copyright © 2016年 FeiGuangpu. All rights reserved.
//

#import "SANetworkOperation.h"

@implementation SANetworkOperation

-(void) addCompletionHandler:(MKNKResponseBlock1) response errorHandler:(MKNKResponseErrorBlock1) error
{
    
    [super addCompletionHandler:(MKNKResponseBlock)response errorHandler:(MKNKResponseErrorBlock)error];

}
- (id)initWithURLString:(NSString *)aURLString
                 params:(NSDictionary *)params
             httpMethod:(NSString *)method
{
    return  [super initWithURLString:aURLString params:params httpMethod:method];
}


@end

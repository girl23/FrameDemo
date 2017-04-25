
//
//  SANetworkEngine.m
//  MicroClassroom
//
//  Created by wdwk on 16/4/19.
//  Copyright © 2016年 FeiGuangpu. All rights reserved.
//

#import "SANetworkEngine.h"
#import "SANetworkOperation.h"
@implementation SANetworkEngine

- (id) initWithHostName:(NSString*) hostName apiPath:(NSString*) apiPath customHeaderFields:(NSDictionary*) headers
{
    return [super initWithHostName:hostName apiPath:apiPath customHeaderFields:headers];
}

- (Class)customOperationSubclass
{
    return [SANetworkOperation class];
}

-(SANetworkOperation*) operationWithURLString:(NSString*) urlString
                                       params:(NSDictionary*) body
                                   httpMethod:(NSString*)method {
    
    SANetworkOperation *operation =nil;
    if (operation==nil) {
        operation = [[self.customOperationSubclass alloc] initWithURLString:urlString params:body httpMethod:method];
    }
    
    [super prepareHeaders:operation];
    
    return operation;
}

-(void) enqueueOperation:(MKNetworkOperation*) operation
{
    [super enqueueOperation:operation];
}

@end

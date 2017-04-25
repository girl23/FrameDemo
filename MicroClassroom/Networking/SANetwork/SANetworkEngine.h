//
//  SANetworkEngine.h
//  MicroClassroom
//
//  Created by wdwk on 16/4/19.
//  Copyright © 2016年 FeiGuangpu. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface SANetworkEngine : MKNetworkEngine

- (id) initWithHostName:(NSString*) hostName apiPath:(NSString*) apiPath customHeaderFields:(NSDictionary*) headers;

-(MKNetworkOperation*) operationWithURLString:(NSString*) urlString
                                       params:(NSDictionary*) body
                                   httpMethod:(NSString*)method;
-(void) enqueueOperation:(MKNetworkOperation*) operation ;
@end

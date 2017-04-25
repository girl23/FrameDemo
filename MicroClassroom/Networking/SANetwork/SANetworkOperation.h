//
//  SANetworkOperation.h
//  MicroClassroom
//
//  Created by wdwk on 16/4/19.
//  Copyright © 2016年 FeiGuangpu. All rights reserved.
//

#import "MKNetworkOperation.h"
@class SANetworkOperation;

typedef void (^MKNKResponseBlock1)(SANetworkOperation* completedOperation);
typedef void (^MKNKResponseErrorBlock1)(SANetworkOperation* completedOperation, NSError* error);

@interface SANetworkOperation : MKNetworkOperation

- (id)initWithURLString:(NSString *)aURLString
                 params:(NSDictionary *)params
             httpMethod:(NSString *)method;

-(void) addCompletionHandler:(MKNKResponseBlock1) response errorHandler:(MKNKResponseErrorBlock1) error;



@end

//
//  SFCBaseModel.h
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-8-26.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCNetworkEngine.h"

typedef enum
{
    ERefresh,
    ELoadMore,
    
}SFCRefreshType;

@interface MCBaseModel : NSObject

@property(nonatomic, readwrite)SFCRefreshType refreshType;

@property(nonatomic, strong)SANetworkOperation * operation;//MKNetworkOperation *operation;

@property(nonatomic)NSInteger currentPage;
//在子类的init函数中初始化
@property(nonatomic)NSInteger pageCount;

-(void)cancel;

@end

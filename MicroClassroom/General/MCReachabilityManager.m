//
//  MCReachabilityManager.m
//  MicroClassroom
//
//  Created by wdwk on 2017/3/8.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "MCReachabilityManager.h"
#import "Reachability.h"
static MCReachabilityManager * reachabilityManager=nil;

@interface MCReachabilityManager()

@property (nonatomic) Reachability *hostReachability;

@end
@implementation MCReachabilityManager
+(instancetype)shareReachabilityManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reachabilityManager=[[MCReachabilityManager alloc]init];
    });
    return reachabilityManager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        NSString *remoteHostName = @"www.apple.com";
        self.hostReachability = [Reachability reachabilityWithHostname:remoteHostName];
        [self.hostReachability startNotifier];
        [self updateInterfaceWithReachability:self.hostReachability];
       
    }
    return self;
}
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
    
}
- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
   
    switch (netStatus)
    {
        case NotReachable:        {
            [SVProgressHUD showWithStatus:@"无网络链接，请检查网络！"];
            break;
        }
            
        case ReachableViaWWAN:        {
            [SVProgressHUD showWithStatus:@"正在使用流量"];
            break;
        }
        case ReachableViaWiFi:        {
            
            [SVProgressHUD showWithStatus:@"正在使用WI-FI"];
            break;
        }
            
    }
      [self performSelector:@selector(delayDismissSV) withObject:self afterDelay:2.5];
    
}

-(void)delayDismissSV
{
    [SVProgressHUD dismiss];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end

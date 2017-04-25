//
//  MCUserInfoManager.m
//  MicroClassroom
//
//  Created by huangyong on 14-11-10.
//  Copyright (c) 2014年 FeiGuangpu. All rights reserved.
//

#import "MCUserInfoManager.h"
#import "MCAppDelegate.h"

#define GT_USERINFO_ID @"GTUserInfo_UserID"
#define GT_USERINFO_Token @"GTUserInfo_Token"
#define GT_USERINFO_NickName @"GTUserInfo_Token"

@implementation MCUserInfoManager

+(MCUserInfoManager*)shareManager{
    
    static MCUserInfoManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[MCUserInfoManager alloc] init];
        
    });
    
    return manager;
}

-(id)init
{
    if (self = [super init]) {
        
        //获取账号信息
        _name = [[NSUserDefaults standardUserDefaults] objectForKey:GT_USERINFO_ID];
        _accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:GT_USERINFO_Token];
        
        _nickName =[[NSUserDefaults standardUserDefaults] objectForKey:@"NICE_NAME"];
        
        _mobile = [[NSUserDefaults standardUserDefaults] objectForKey:@"member_phone"];
        _sex = [[NSUserDefaults standardUserDefaults] objectForKey:@"member_sex"];
        _birthday = [[NSUserDefaults standardUserDefaults] objectForKey:@"member_birthday"];
        _qq = [[NSUserDefaults standardUserDefaults] objectForKey:@"member_qq"];
        _address = [[NSUserDefaults standardUserDefaults] objectForKey:@"member_areainfo"];
        _weixin = [[NSUserDefaults standardUserDefaults] objectForKey:@"member_ww"];
        _userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"member_id"];

    }
    return self;
}

- (BOOL)isAuthValid{
    
    BOOL isValid = NO;
    
    if (_accessToken && _name) {
        
        isValid = YES;
    }
    
    return isValid;
}

/*
 * 登录
 */
-(void)login:(NSString *)loginName passWord:(NSString *)userPass token:(NSString *)token
{
    
    if ((!loginName || !userPass )) {
        
        self.error = [NSError errorWithDomain:@"unknown"
                                         code:-1
                                     userInfo:@{NSLocalizedDescriptionKey:@"请输入用户名和密码"}];
        return;
    }
    if (token.length<=0) {
        self.error = [NSError errorWithDomain:@"unknown"
                                         code:-1
                                     userInfo:@{NSLocalizedDescriptionKey:@"请检查网络"}];
        NSLog(@"token为空");
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    
    MCNetworkEngine *networkEngine = [MCNetworkEngine defaultEngine];
    
    [networkEngine Login:loginName passWord:userPass token:token callback:^(id resp, NSError *error) {
        if (!error){
            
            NSDictionary *dicData = [resp isKindOfClass:[NSDictionary class]]?(NSDictionary*)resp:nil;
            //提取想要的信息
            if (dicData && [dicData[@"code"] integerValue] == 0) {
                
                weakSelf.accessToken = dicData[@"token"];
                weakSelf.name = [dicData valueForKeyPath:@"user_infor.member_email"];
                weakSelf.nickName = [dicData valueForKeyPath:@"user_infor.member_name"];
                weakSelf.userId = [dicData valueForKeyPath:@"user_infor.member_id"];
                weakSelf.mobile = [dicData valueForKeyPath:@"user_infor.member_phone"];
                weakSelf.sex = [dicData valueForKeyPath:@"user_infor.member_sex"];
                weakSelf.birthday = [dicData valueForKeyPath:@"user_infor.member_birthday"];
                weakSelf.qq = [dicData valueForKeyPath:@"user_infor.member_qq"];
                weakSelf.address = [dicData valueForKeyPath:@"user_infor.member_areainfo"];
                weakSelf.weixin = [dicData valueForKeyPath:@"user_infor.member_ww"];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.name forKey:GT_USERINFO_ID];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.accessToken forKey:GT_USERINFO_Token];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.nickName forKey:@"NICE_NAME"];
            
                
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.userId forKey:@"member_id"];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.mobile forKey:@"member_phone"];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.sex forKey:@"member_sex"];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.birthday forKey:@"member_birthday"];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.qq forKey:@"member_qq"];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.address forKey:@"member_areainfo"];
                [[NSUserDefaults standardUserDefaults] setObject:weakSelf.weixin forKey:@"member_ww"];
                
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [weakSelf willChangeValueForKey:@"isAuthValid"];
                [weakSelf didChangeValueForKey:@"isAuthValid"];
            }
            else{
                NSString *errorMessage = @"登录失败";
                
                if (dicData && dicData[@"msg"]) {
                    
                    errorMessage = [dicData valueForKeyPath:@"msg"];
                    
                }
                
                [SVProgressHUD showErrorWithStatus:errorMessage];
                 
            }
        }
        else{
            
            weakSelf.error = error;
        
    
            
        }
    }];
}

-(void)save{
    
    [[NSUserDefaults standardUserDefaults] setObject:self.name forKey:GT_USERINFO_ID];
    [[NSUserDefaults standardUserDefaults] setObject:self.accessToken forKey:GT_USERINFO_Token];
    [[NSUserDefaults standardUserDefaults] setObject:self.nickName forKey:@"NICE_NAME"];
   
    [[NSUserDefaults standardUserDefaults] setObject:self.mobile forKey:@"member_phone"];
    [[NSUserDefaults standardUserDefaults] setObject:self.sex forKey:@"member_sex"];
    [[NSUserDefaults standardUserDefaults] setObject:self.birthday forKey:@"member_birthday"];
    [[NSUserDefaults standardUserDefaults] setObject:self.qq forKey:@"member_qq"];
    [[NSUserDefaults standardUserDefaults] setObject:self.address forKey:@"member_areainfo"];
    [[NSUserDefaults standardUserDefaults] setObject:self.weixin forKey:@"member_ww"];
    [[NSUserDefaults standardUserDefaults] setObject:self.userId forKey:@"member_id"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

/*
 * 登出
 */
-(void)logOut{
    
    self.name = nil;
    self.accessToken=nil;
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:GT_USERINFO_ID];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:GT_USERINFO_Token];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"member_phone"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"member_sex"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"member_birthday"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"member_qq"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"member_areainfo"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"member_ww"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"member_id"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self willChangeValueForKey:@"isAuthValid"];
    [self didChangeValueForKey:@"isAuthValid"];
}

@end

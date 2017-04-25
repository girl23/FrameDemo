//
//  MCUserInfoManager.h
//  MicroClassroom
//
//  Created by huangyong on 14-11-10.
//  Copyright (c) 2014年 FeiGuangpu. All rights reserved .
//

#import <Foundation/Foundation.h>

@interface MCUserInfoManager : NSObject

/*
 * 登录相关
 */
@property (strong, nonatomic) NSError *error;     //错误信息
@property (nonatomic,readonly) BOOL isAuthValid;//是否可用

/*
 * 用户信息相关
 */
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *userId;

@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *weixin;


+(MCUserInfoManager*)shareManager;

/*
 * 登录
 */
-(void)login:(NSString *)loginName passWord:(NSString *)userPass token:(NSString *) token;

/*
 * 登出
 */
-(void)logOut;

-(void)save;

@end

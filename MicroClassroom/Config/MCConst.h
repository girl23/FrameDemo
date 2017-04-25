//
//  MCConst.h
//  MicroClassroom
//
//  Created by wdwk on 2017/3/3.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCNetworkEngine.h"
#import "SVProgressHUD.h"
#import "UIColorCategory.h"
#import "IQUIView+Hierarchy.h"
#import "MCCustomizeControl.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "MCBasicDataManager.h"
#import "MCTools.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

//常量定义
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define MC_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define MC_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define MC_TABBAR_HEIGHT 49
#define MC_NAVBAR_HEIGHT 44
#define MC_STATUSBAR_HEIGHT 20
#define MC_NAVBAR_HEIGHT_WITH_STATUS_BAR (MC_NAVBAR_HEIGHT+20)

#define APP_GUIDED_VERSION @"appGuidedVerison"//已进行引导过的版本(进行引导过即非第一次启动）
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

//5.9免费接口（）
//#define KFS_SERVER_ADDRESS @"http://wkscapi.eastedu.com/mallapi/"
//#define KFS_SERVER_DOWNLOAD_ADDRESS @"http://125.69.76.128:8887/upload/files/question/"
//7.11接口这个固定是测试用的
#define KFS_SERVER_ADDRESS @"http://192.168.200.65:8898/wksc/mallapi"
#define KFS_SERVER_DOWNLOAD_ADDRESS @"http://192.168.200.65:8887/upload/files/question/"
//本地服务器：那以后开发都固定这个
//#define KFS_SERVER_ADDRESS @"http://192.168.200.65:8898/wkscdev/mallapi"
//#define KFS_SERVER_DOWNLOAD_ADDRESS @"http://192.168.200.65:8887/upload/files/question/"


//字体大小
#define MC_NAVBAR_TITLE_FONT_SIZE 18
#define TITLE_FONT_SIZE [UIFont systemFontOfSize:16.0f]
#define TEXT_FONT_SIZE [UIFont systemFontOfSize:14.0f]
#define DESCRIPTION_FONT_SIZE [UIFont systemFontOfSize:12.0f]


//颜色定义
#define GREEN_COLOR [UIColor colorWithHexString:@"#289155"]
//粉红色
#define PINK_COLOR [UIColor colorWithHexString:@"#ff6161"]
//标题文字
#define TITLE_COLOER [UIColor colorWithHexString:@"#323232"]
//正文文字
#define TEXT_COLOR [UIColor colorWithHexString:@"#646464"]
//辅助性文字
#define DESCRIPTION_COLOR [UIColor colorWithHexString:@"#969696"]
//图标
#define IMAGE_COLOR [UIColor colorWithHexString:@"#c8c8c8"]
//描边
#define EDGE_COLOR [UIColor colorWithHexString:@"#e0e0e0"]
//背景
#define BACKGROUD_COLOR [UIColor colorWithHexString:@"#f4f4f4"]


//按钮颜色
#define ORANGE_COLOR_BUTTON_NORMAL [UIColor colorWithHexString:@"#ffb932"]
#define ORANGE_COLOR_BUTTON_SELECT [UIColor colorWithHexString:@"#f5a532"]

#define PINK_COLOR_BUTTON_NORMAL [UIColor colorWithHexString:@"#ff6161"]
#define PINK_COLOR_BUTTON_SELECT [UIColor colorWithHexString:@"#f05f5f"]

#define GREEN_COLOR_BUTTON_NORMAL [UIColor colorWithHexString:@"#289155"]
#define GREEN_COLOR_BUTTON_SELECT [UIColor colorWithHexString:@"#28824b"]

#define GRAY_COLOR_BUTTON_NORMAL [UIColor colorWithHexString:@"#646464"]


#define BUNDLE_FILE_PATH(FILE_NAME) [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:FILE_NAME]

//缓存文件路径
#define KSFC_CACHE_ROOT_FOLDER @"SFCCacheRootFolder"    //缓存跟文件夹
#define KSFC_SEARCH_HELP_INFOR_CACHE_FILE @"SFCSearchHelpInforCacheFile" //搜索帮助信息缓存文件名

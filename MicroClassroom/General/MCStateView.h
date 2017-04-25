//
//  SFCStateView.h
//  SinaFreshCity
//
//  Created by HuangYong on 14-9-2.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCStateView : UIControl

@property (strong, nonatomic) UILabel *textLabel;

@property (strong, nonatomic) UIButton *actionButton;

@property (strong,nonatomic) UIView *errorDesView;
//默认背景页面
+ (MCStateView *)emptyViewWithFrame:(CGRect)frame;

//收藏页没有收藏的背景页面
+ (MCStateView *)emptyFavoriteViewWithFrame:(CGRect)frame;
//通知页没有通知的背景页面
+ (MCStateView *)emptyMessageViewWithFrame:(CGRect)frame withString:(NSString * )string andimageStr:(NSString * )imageString;
//网络错误提醒
+ (MCStateView *)netErrorViewWithFrame:(CGRect)frame target:(id)target action:(SEL)action;

//未登录
+ (MCStateView *)noLoginViewWithFrame:(CGRect)frame target:(id)target action:(SEL)action;
//+ (MCStateView *)emptyMessageViewWithFrame1:(CGRect)frame withString:(NSString * )string andimageStr:(NSString * )imageString;
@end

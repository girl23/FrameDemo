//
//  SFCStateView.m
//  SinaFreshCity
//
//  Created by HuangYong on 14-9-2.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import "MCStateView.h"

static NSString * const kNetworkError = @"网络不太给力啊:\n触摸屏幕重试";
static NSString * const kNoLoginError = @"亲，你还没有登录哟~";

@interface MCStateView ()

@property (nonatomic,strong) UIImageView *imageView;
@end


@implementation MCStateView

@synthesize imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
        
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error_image_empty"]];
        [imageView sizeToFit];
        imageView.centerX = self.width/2;
        imageView.centerY = self.height/2-30;
        [self addSubview:imageView];
        
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.textLabel.numberOfLines = 0;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor colorWithHexString:@"525252"];
        self.textLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.textLabel];
        
        self.errorDesView = [self networkErrorDesView];
        self.errorDesView.hidden = YES;
        self.errorDesView.top = imageView.bottom+20;
        self.errorDesView.centerX = self.width/2;
        [self addSubview:self.errorDesView];
        
        self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.actionButton.backgroundColor = [UIColor clearColor];
        self.actionButton.frame = self.bounds;
        [self addSubview:self.actionButton];
    }
    return self;
}

//默认背景页面
+ (MCStateView *)emptyViewWithFrame:(CGRect)frame{
    
     MCStateView *view = [[MCStateView alloc]initWithFrame:frame];
    [view.textLabel removeFromSuperview];
    [view.actionButton removeFromSuperview];
    return view;
}

+ (MCStateView *)errorViewWithFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action
{
    MCStateView *view = [[MCStateView alloc] initWithFrame:frame];
    view.textLabel.text = title;
    [view.actionButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return view;
}

+ (MCStateView *)netErrorViewWithFrame:(CGRect)frame target:(id)target action:(SEL)action
{
    MCStateView *view = [[MCStateView alloc]initWithFrame:frame];
    [view.textLabel removeFromSuperview];
    view.imageView.image = [UIImage imageNamed:@"error_image"];
    view.textLabel = nil;
    view.errorDesView.hidden = NO;
    [view.actionButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return view;
}

//未登录
+ (MCStateView *)noLoginViewWithFrame:(CGRect)frame target:(id)target action:(SEL)action{
    
    MCStateView *view = [[MCStateView alloc]initWithFrame:frame];
    
    view.textLabel.text = kNoLoginError;
    
    view.imageView.image = [UIImage imageNamed:@"error_image_weibo"];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 145, 34)];
    [loginButton setBackgroundImage:[[UIImage imageNamed:@"button_weibo_white_normal.png"] stretchableImageWithLeftCapWidth:40 topCapHeight:13.5] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[[UIImage imageNamed:@"button_weibo_white_pressed.png"] stretchableImageWithLeftCapWidth:40 topCapHeight:13.5] forState:UIControlStateHighlighted];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [loginButton setTitle:@"微博登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor colorWithHexString:@"#00a685"] forState:UIControlStateNormal];
    
    [view.actionButton removeFromSuperview];
    view.actionButton = loginButton;
    [view addSubview:loginButton];
    
    [view.actionButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [view layoutIfNeeded];
    return view;
}

//收藏页没有收藏的背景页面
+ (MCStateView *)emptyFavoriteViewWithFrame:(CGRect)frame{
    
    MCStateView *view = [[MCStateView alloc]initWithFrame:frame];
    
    [view.textLabel removeFromSuperview];
    [view.actionButton removeFromSuperview];
    [view.errorDesView removeFromSuperview];
    
    UIView *emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 70)];
    emptyView.backgroundColor = [UIColor clearColor];
    [view addSubview:emptyView];
    
    emptyView.top = view.imageView.bottom+20;
    emptyView.centerX = view.width/2;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 17)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = [UIColor colorWithHexString:@"525252"];
    titleLabel.text = @"咦~收藏夹空空的";
    [emptyView addSubview:titleLabel];
    
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom+10, 200, 11)];
    subtitleLabel.backgroundColor = [UIColor clearColor];
    subtitleLabel.font = [UIFont systemFontOfSize:10];
    subtitleLabel.textColor = [UIColor colorWithHexString:@"525252"];
    subtitleLabel.text = @"若遇到喜欢的，可别错过收藏哟";
    [subtitleLabel sizeToFit];
    subtitleLabel.centerX = emptyView.width/2;
    [emptyView addSubview:subtitleLabel];
    
    UIImageView *pointView = [[UIImageView alloc] initWithFrame:CGRectMake(subtitleLabel.left -8, titleLabel.bottom + 14, 4, 4)];
    pointView.image = [UIImage imageNamed:@"dot.png"];
    [emptyView addSubview:pointView];
    
    
    return view;
}
//+ (MCStateView *)emptyMessageViewWithFrame:(CGRect)frame withString:(NSString * )string andimageStr:(NSString * )imageString{
//    
//    float imgWith=60;
//    MCStateView *view = [[MCStateView alloc]initWithFrame:frame];
//    [view.textLabel removeFromSuperview];
//    [view.actionButton removeFromSuperview];
//    [view.errorDesView removeFromSuperview];
//    
//    UIView *emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 70)];
//    emptyView.backgroundColor = [UIColor clearColor];
//    [view addSubview:emptyView];
//    
////    view.imageView.centerY=0;
//    
//    emptyView.top = view.imageView.bottom;//+20;
//    emptyView.centerX = view.width/2;
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 17)];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.font = [UIFont systemFontOfSize:14];
//    titleLabel.textColor = [UIColor colorWithHexString:@"#969696"];
//    titleLabel.text = string;//@"暂未发布课程通知哟！";
//    [emptyView addSubview:titleLabel];
//    
//    UIImage * img=[UIImage imageNamed:imageString];
//
//    UIImageView *pointView =[UIImageView new];
//    pointView.top=titleLabel.top-10-img.size.height;
//    
//    pointView.image =img;//@"notice_empty.png"];
//    [pointView sizeToFit];
//    pointView.centerX=titleLabel.centerX;
//    [emptyView addSubview:pointView];
//     NSLog(@"x:%f  y:%f  w:%f  h%f",pointView.frame.origin.x,pointView.frame.origin.y,pointView.frame.size.width,pointView.frame.size.height);
//    
//    return view;
//}

+ (MCStateView *)emptyMessageViewWithFrame:(CGRect)frame withString:(NSString * )string andimageStr:(NSString * )imageString{
    
    MCStateView *view = [[MCStateView alloc]initWithFrame:frame];
    [view.textLabel removeFromSuperview];
    [view.actionButton removeFromSuperview];
    [view.errorDesView removeFromSuperview];
    [view.imageView removeFromSuperview];
    
    UIView *emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    emptyView.backgroundColor = [UIColor clearColor];
    [view addSubview:emptyView];
    
    UIImage * img=[UIImage imageNamed:imageString];
    UIImageView *pointView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
    pointView.centerY=emptyView.centerY;
    pointView.centerX=emptyView.centerX;
    pointView.image =img;
    [emptyView addSubview:pointView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, emptyView.frame.size.width, 17)];
    titleLabel.centerX=emptyView.centerX;
    titleLabel.top=pointView.bottom+10;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor colorWithHexString:@"#969696"];
    titleLabel.text = string;//@"暂未发布课程通知哟！";
    [emptyView addSubview:titleLabel];
    
    return view;
}

- (UIView *)networkErrorDesView{
    
    UIView *errorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 70)];
    errorView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 17)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = [UIColor colorWithHexString:@"525252"];
    titleLabel.text = @"哎呀，出错啦！";
    [errorView addSubview:titleLabel];
    
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom+15, 200, 11)];
    subtitleLabel.backgroundColor = [UIColor clearColor];
    subtitleLabel.font = [UIFont systemFontOfSize:10];
    subtitleLabel.textColor = [UIColor colorWithHexString:@"525252"];
    subtitleLabel.text = @"网络不稳定，请点击屏幕重试";
    [subtitleLabel sizeToFit];
    subtitleLabel.centerX = errorView.width/2;
    [errorView addSubview:subtitleLabel];
    
    UILabel *subtitleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom+27, 200, 11)];
    subtitleLabel2.backgroundColor = [UIColor clearColor];
    subtitleLabel2.font = [UIFont systemFontOfSize:10];
    subtitleLabel2.textColor = [UIColor colorWithHexString:@"525252"];
    subtitleLabel2.text = @"请检测你的网络设置是否正确";
    [subtitleLabel2 sizeToFit];
    subtitleLabel2.centerX = errorView.width/2;
    [errorView addSubview:subtitleLabel2];
    
    UIImageView *pointView = [[UIImageView alloc] initWithFrame:CGRectMake(subtitleLabel.left -8, titleLabel.bottom + 19, 4, 4)];
    pointView.image = [UIImage imageNamed:@"dot.png"];
    [errorView addSubview:pointView];
    
    UIImageView *pointView2 = [[UIImageView alloc] initWithFrame:CGRectMake(subtitleLabel2.left-8, titleLabel.bottom + 32, 4, 4)];
    pointView2.image = [UIImage imageNamed:@"dot.png"];
    [errorView addSubview:pointView2];

    
    return errorView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGSize size = [self.textLabel.text sizeWithFont:self.textLabel.font constrainedToSize:CGSizeMake(self.width/2, CGFLOAT_MAX)];
//    self.textLabel.frame = (CGRect){CGPointMake(self.width / 2, 0), size};
//    self.textLabel.top = imageView.bottom + 19;
//    self.textLabel.centerX = self.width/2;
//    
//    if ([[self.actionButton titleForState:UIControlStateNormal] isEqualToString:@"微博登录"]) {
//        self.actionButton.top = self.textLabel.bottom +15;
//        self.actionButton.centerX = self.width/2;
//    }
}

@end

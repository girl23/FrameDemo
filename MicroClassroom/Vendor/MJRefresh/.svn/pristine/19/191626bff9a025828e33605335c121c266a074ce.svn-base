//
//  SFCMJLoadingView.m
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-9-9.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import "SFCMJLoadingView.h"

#define kBundleName @"MJRefresh.bundle"
#define kSrcName(file) [kBundleName stringByAppendingPathComponent:file]

@interface SFCMJLoadingView()
{
    
}

@property(nonatomic, strong)NSTimer *animateTimer;
@property(nonatomic, readwrite)NSInteger angle;

@end

@implementation SFCMJLoadingView

-(instancetype)initWithImageFrame:(CGRect)frame{
    UIImage* image = [UIImage imageNamed:kSrcName(@"tableview_loading.png")];
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.loadingView = [[UIImageView alloc]initWithImage:image];
        self.loadingView.frame = self.bounds;
        self.loadingView.centerX = self.width / 2;
        self.loadingView.centerY = self.height / 2;
        [self addSubview:self.loadingView];
        self.angle = 1;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    UIImage* image = [UIImage imageNamed:kSrcName(@"tableview_loading.png")];
    frame.size = image.size;
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.loadingView = [[UIImageView alloc]initWithImage:image];
        self.loadingView.centerX = self.width / 2;
        self.loadingView.centerY = self.height / 2;
        [self addSubview:self.loadingView];
        self.angle = 1;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)startAnimating
{
    if (self.animateTimer==nil) {
        self.animateTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(next) userInfo:nil repeats:YES];
    }
    self.hidden = NO;
}

-(void)stopAnimating
{
    [self.animateTimer invalidate];
    self.animateTimer = nil;
    self.hidden = YES;
    self.angle = 1;
}

-(void)next
{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(self.angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.loadingView.transform = endAngle;
    } completion:^(BOOL finished) {
        self.angle += 10;
    }];
}

@end

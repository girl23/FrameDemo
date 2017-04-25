//
//  GuideView.h
//  MicroClassroom
//
//  Created by chenyongkang on 15/10/20.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuideView;

@protocol GuideViewDelegate<NSObject>
-(void)guideViewClickUseNowWithSelf:(GuideView*)guideView;
@end

@interface GuideView : UIViewController
@property(assign,nonatomic)id<GuideViewDelegate>delegate;

@end

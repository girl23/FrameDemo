//
//  MCTabBarButton.h
//  MicroClassroom
//
//  Created by wdwk on 2017/3/6.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCBadgeNumButton.h"
@interface MCTabBarButton : UIButton
@property (nonatomic, strong) UITabBarItem *item;
@property (nonatomic, strong) MCBadgeNumButton *badgeNumBtn;
@end

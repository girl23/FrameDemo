//
//  MCTabBar.h
//  MicroClassroom
//
//  Created by wdwk on 2017/3/6.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCTabBar;

@protocol MCTabBarDelegate <NSObject>

@optional
- (void)tabBar:(MCTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
@end

@interface MCTabBar : UIView
- (void)addTabBarButtonItem:(UITabBarItem *)item;
@property (nonatomic, weak) id<MCTabBarDelegate> delegate;
@property (nonatomic, weak) UIButton *middleBtn;
@end

//
//  MCTabBar.m
//  MicroClassroom
//
//  Created by wdwk on 2017/3/6.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "MCTabBar.h"
#import "MCTabBarButton.h"
@interface MCTabBar ()
@property (nonatomic, strong) NSMutableArray *tabBarBtnArray;
@property (nonatomic, weak) MCTabBarButton *selectedBtn;
@end

@implementation MCTabBar

- (NSMutableArray *)tabBarBtnArray {
    if (!_tabBarBtnArray) {
        _tabBarBtnArray = [NSMutableArray array];
    }
    return _tabBarBtnArray;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //如果中间按钮需要特殊处理在调用
        // 添加中间的按钮
        //        UIButton *midBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [midBtn setBackgroundImage:[UIImage imageNamed:@"首页_写鸡毛信"] forState:UIControlStateNormal];
        //        midBtn.bounds = CGRectMake(0, 0, midBtn.currentBackgroundImage.size.width, midBtn.currentBackgroundImage.size.height);
        //        [self addSubview:midBtn];
        //        self.middleBtn = midBtn;
    }
    return self;
}
- (void)addTabBarButtonItem:(UITabBarItem *)item {
    
    MCTabBarButton *btn = [MCTabBarButton new];
    [self addSubview:btn];
    [self.tabBarBtnArray addObject:btn];
    
    btn.item = item;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.tabBarBtnArray.count == 1) {
        [self btnClick:btn];
    }
    
}
- (void)btnClick:(MCTabBarButton *)button {
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {

        [self.delegate tabBar:self didSelectedButtonFrom:[[NSString stringWithFormat:@"%ld",(long)self.selectedBtn.tag]intValue] to:[[NSString stringWithFormat:@"%ld",(long)button.tag]intValue]];
    }
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    self.middleBtn.center = CGPointMake(w * 0.5, h * 0.5);
    
    CGFloat btnH = h;
    CGFloat btnW = w / self.subviews.count;
    CGFloat btnY = 0;
    for (int index = 0; index < self.tabBarBtnArray.count; index++) {
        MCTabBarButton *btn = self.tabBarBtnArray[index];
        
        //用于位置调试
//        CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
//        CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
//        CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
//        btn.backgroundColor=[UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
        
        CGFloat btnX = index * btnW;
        //中间按钮特殊处理
        //        if (index > 1) {
        //            btnX += btnW;
        //        }
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = index;
    }
}

@end

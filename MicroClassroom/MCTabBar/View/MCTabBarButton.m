//
//  MCTabBarButton.m
//  MicroClassroom
//
//  Created by wdwk on 2017/3/6.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "MCTabBarButton.h"
// 图标的比例
#define MCTABBAR_BUTTON_IMAGE_RADIO 0.6
@implementation MCTabBarButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        // 提醒数字，其实就是一个按钮
        MCBadgeNumButton *badgeBtn = [MCBadgeNumButton new];
        badgeBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeBtn];
        self.badgeNumBtn = badgeBtn;

        
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted {}
// 内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * MCTABBAR_BUTTON_IMAGE_RADIO;
    
    return CGRectMake(0, 2, imageW, imageH);
    
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = contentRect.size.height * MCTABBAR_BUTTON_IMAGE_RADIO;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
- (void)setItem:(UITabBarItem *)item {
    _item = item;
    // 监听属性的改变 KVO
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
}
/**
 *  必须手动释放
 */
- (void)dealloc {
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}
/**
 *  监听到某个对象的属性改变了,就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    // 文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    
    self.badgeNumBtn.badgeNum = self.item.badgeValue;
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeNumBtn.frame.size.width - 10;
    CGRect badgeF = self.badgeNumBtn.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeNumBtn.frame = badgeF;

    
}

@end

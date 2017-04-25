//
//  MCBadgeNumButton.m
//  MicroClassroom
//
//  Created by wdwk on 2017/3/6.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "MCBadgeNumButton.h"

@implementation MCBadgeNumButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}

#pragma mark - 重写数字的setter方法
- (void)setBadgeNum:(NSString *)badgeNum {
    _badgeNum = [badgeNum copy];
    if (badgeNum) {
        self.hidden = NO;
        [self setTitle:badgeNum forState:UIControlStateNormal];
        
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeNum.length > 1) {
//          CGSize badgeSize = [badgeNum sizeWithFont:self.titleLabel.font];
            CGSize badgeSize= [badgeNum sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
    } else {
        self.hidden = YES;
    }
}
@end

//
//  SFCMJLoadingView.h
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-9-9.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFCMJLoadingView : UIView

@property(nonatomic, strong)UIImageView* loadingView;

-(instancetype)initWithImageFrame:(CGRect)frame;
-(void)startAnimating;
-(void)stopAnimating;

@end

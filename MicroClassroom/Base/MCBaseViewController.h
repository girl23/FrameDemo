//
//  MCBaseViewController.h
//  MicroClassroom
//
//  Created by wdwk on 2017/3/7.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCStateView.h"

@interface MCBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    MCStateView *blankDataLab;
}

@property(nonatomic, retain)UITableView* tableView;
-(void)stopRefreshLoadMore;
-(void)searchButtonClicked:(id)sender;
-(void)initNavButtons;
@end

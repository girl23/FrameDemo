//
//  WLSecondViewController.m
//  WLCustomTabbar
//
//  Created by ZhengZhong on 2016/11/22.
//  Copyright © 2016年 WenLong. All rights reserved.
//

#import "WLSecondViewController.h"
#import "WLThirdViewController.h"
@interface WLSecondViewController ()

@end

@implementation WLSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    btn.backgroundColor=[UIColor whiteColor];
    [btn setTitle:@"next" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(nextpage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)nextpage
{
    WLThirdViewController * sV=[WLThirdViewController new];
    [self.navigationController pushViewController:sV animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

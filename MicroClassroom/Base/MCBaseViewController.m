//
//  MCBaseViewController.m
//  MicroClassroom
//
//  Created by wdwk on 2017/3/7.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "MCNavigationController.h"
#import "MCBaseViewController.h"
#import "UINavigationBar+Awesome.h"
@interface MCBaseViewController ()

@end

@implementation MCBaseViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithHexString:@"#f0f0f0"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.top =0;//MC_NAVBAR_HEIGHT_WITH_STATUS_BAR;
    self.tableView.height =self.view.height;//self.view.height - MC_NAVBAR_HEIGHT_WITH_STATUS_BAR - MC_TABBAR_HEIGHT;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundView = nil;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:self.tableView];
    
//    //  加载数据为空时，显示提示Lab
//    blankDataLab=[MCStateView emptyMessageViewWithFrame:CGRectMake(0, 0, MC_SCREEN_WIDTH, self.tableView.frame.size.height) withString:@"暂无更多内容" andimageStr:@"ic_null"];
//    [blankDataLab setHidden:YES];
//    [self.tableView addSubview:blankDataLab];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithHexString:@"289155"]];
    [self initNavButtons];
}
-(void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar lt_reset];
}

-(void)initNavButtons
{
    
    if (self.navigationController.viewControllers.count>1) {
        
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.showsTouchWhenHighlighted = YES;
        backBtn.backgroundColor = [UIColor clearColor];
        
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [backBtn setImage:[UIImage imageNamed:@"arrow-left.png"] forState:UIControlStateNormal];
        
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [backBtn sizeToFit];
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:self
                                                                                   action:nil];
        flexSpacer.width = -10;
        
        [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:flexSpacer,item, nil]];
    }
    
    
    
    UIView* titleView = [[UIView alloc]initWithFrame:self.view.bounds];
    
    titleView.backgroundColor = [UIColor clearColor];
    
    titleView.width = MC_SCREEN_WIDTH - 35*2;
    
    titleView.height = 30;
    
    
    
    UIImageView* searchBarBgView = [[UIImageView alloc]init];
    
    searchBarBgView.backgroundColor = [UIColor whiteColor];
    
    searchBarBgView.userInteractionEnabled = YES;
    
    searchBarBgView.width = titleView.width - 12; //30是左右间距和中间间距各15
    
    searchBarBgView.height = 30;
    
    searchBarBgView.left = 0;
    
    searchBarBgView.top = 0;
    
    searchBarBgView.layer.masksToBounds = YES;
    
    searchBarBgView.layer.cornerRadius = 14.0; //设置图片圆角的尺度
    
      searchBarBgView.image = [[UIImage imageNamed:@"搜索框"]  stretchableImageWithLeftCapWidth:150 topCapHeight:15];
    
    [titleView addSubview:searchBarBgView];
    
    UILabel* textFieldPlaceHolder = [MCCustomizeControl customizeLabel:@"输入您想学习的课程" backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:14.0f] textColor:[UIColor colorWithHexString:@"#a2a29f"] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByWordWrapping];
    
    textFieldPlaceHolder.alpha = 0.5;
    
    textFieldPlaceHolder.left = searchBarBgView.left + 15;
    
    textFieldPlaceHolder.centerY = searchBarBgView.centerY;
    
    [titleView addSubview:textFieldPlaceHolder];
    
    
    
    UIButton* searchFieldBtn = [[UIButton alloc]initWithFrame:searchBarBgView.bounds];
    
    searchFieldBtn.top = 0;
    
    searchFieldBtn.left = 0;
    
    [searchFieldBtn addTarget:self action:@selector(searchButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [searchBarBgView addSubview:searchFieldBtn];
    
    
    
    self.navigationItem.titleView = titleView;
    
    
    
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    if (IOS_VERSION>=7.0){
        flexSpacer.width = -4;
    }
    
    else {
        flexSpacer.width = -5;
    }
    //NavBar右键
    
    UIButton* searchButton = [[UIButton alloc]init];
    
    searchButton.backgroundColor = [UIColor clearColor];
    
    [searchButton setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    
    [searchButton setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateHighlighted];
    
    [searchButton sizeToFit];
    
    [searchButton addTarget:self action:@selector(searchButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    [self.navigationItem setRightBarButtonItems:@[flexSpacer,rightButtonItem]];
    
}
- (void)back{
    [SVProgressHUD dismiss];
    if (self.navigationController.viewControllers.count == 1) {
        
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    [self stopRefreshLoadMore];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)searchButtonClicked:(id)sender

{
    
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

-(void)stopRefreshLoadMore
{
    // 结束刷新状态
    [self.tableView headerEndRefreshing];
    
    [self.tableView footerEndRefreshing];
}

#pragma -mark UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma -mark UITableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}



@end

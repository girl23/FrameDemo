//
//  WLFirstViewController.m
//  WLCustomTabbar
//
//  Created by ZhengZhong on 2016/11/22.
//  Copyright © 2016年 WenLong. All rights reserved.
//

#import "WLFirstViewController.h"
#import "WLSecondViewController.h"

#import "XRCarouselView.h"
#import "MCAdvertisement.h"
#import "MCStage.h"

#define KTopImageScrollViewHeight MC_SCREEN_WIDTH*9/16
#define KSeperatorLineHeight 5
#define KButtonsBgViewHeight 40
#define KCourseTypeBarHeight 80//5个按钮
#define KMCRecommendViewTopViewHeight 450

@interface WLFirstViewController ()
{

    UIView* topView;

    UIImageView* imageView;
}
//当前选中的推荐课程类型
@property(nonatomic, strong)SANetworkOperation * adOperation;
@property(nonatomic, strong)NSMutableArray* adArray;
@property (nonatomic, strong) XRCarouselView *carousel;

//动态写学段
@property(nonatomic, strong)NSMutableArray * stageArr;

@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)NSMutableArray *describeArray;
@end
@implementation WLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor purpleColor];
    _stageArr =[[NSMutableArray alloc]init];
    self.adArray = [[NSMutableArray alloc]init];
    self.imageArray= [[NSMutableArray alloc]init];
    self.describeArray= [[NSMutableArray alloc]init];
    
    self.tableView.tableHeaderView = [self createTopView];
    

    [self registNotificationAndKVO];
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderWithCallback:^{

    
        [[MCBasicDataManager shareInstance]fetchBasicData];
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [weakSelf getAdvertisement];
         });
        [SVProgressHUD showWithStatus:@"请稍等..."];
     
    }];
    [self.tableView headerBeginRefreshing];
}
-(void)getAdvertisement
{
    //网络获取
    MCNetworkEngine *networkEngine = [MCNetworkEngine defaultEngine];
    __weak __typeof(self) weakSelf = self;
    
    self.adOperation = [networkEngine getHomeAdWithCallback:^(id resp, NSError *error)
                        {
                            NSDictionary *dicData = [resp isKindOfClass:[NSDictionary class]]?(NSDictionary*)resp:nil;
                            if (error == nil)
                            {
                               
                                if (dicData && [dicData count] > 0)
                                {
                                    if ([[dicData valueForKey:@"code"] integerValue] == 0)
                                    {
                                        
                                        [weakSelf.adArray removeAllObjects];
                                        [weakSelf.imageArray removeAllObjects];
                                        [weakSelf.describeArray removeAllObjects];
                                        
                                        NSArray* array = [dicData objectForKey:@"ads"];
                                        for (NSDictionary* dic in array) {
                                            
                                            
                                            MCAdvertisement* ad = [[MCAdvertisement alloc]initWithDictionary:dic];
                                            [weakSelf.adArray addObject:ad];
                                            
                                            [weakSelf.imageArray addObject:ad.pictureUrl];
                                            [weakSelf.describeArray addObject:ad.ad_title];
                                        }
                                        self.carousel.imageArray = self.imageArray;
                                        self.carousel.describeArray = self.describeArray;
                                        
                                        
                                    }
                                    else
                                    {
                                        NSString *errorMessage = @"获取推荐课程失败，请重试！";
                                        
                                        if (dicData && dicData[@"msg"]) {
                                            errorMessage = dicData[@"msg"];
                                        }
                                        [SVProgressHUD showErrorWithStatus:errorMessage];
                                    }
                                }
                            }
                            else
                            {
                                NSString *errorMessage = @"获取推荐课程失败，请重试！";
                                
                                if (dicData && dicData[@"msg"]) {
                                    errorMessage = dicData[@"msg"];
                                }
                                [SVProgressHUD showErrorWithStatus:errorMessage];
                            }
           
                        }];
    
    
    
    
}

- (void)dealloc
{
  
    [self removeNotificationAndKVO];
    [self.adOperation cancel];
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"resetADImage" object:nil];
   
}

#pragma -mark regist and remove kvo
-(void)registNotificationAndKVO
{

    
    [[MCBasicDataManager shareInstance] addObserver:self forKeyPath:@"succeed" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)removeNotificationAndKVO
{

    [[MCBasicDataManager shareInstance] removeObserver:self forKeyPath:@"succeed"];
}

-(UIView*)createTopView
{
    topView = [[UIView alloc]init];
    topView.backgroundColor = [UIColor yellowColor];
    topView.top =0;
    topView.left = 0;
    topView.width = self.view.width;
    topView.height = KMCRecommendViewTopViewHeight;//列表和头部的距离
    [self.view addSubview:topView];
    //顶部可滑动imageview高度
    imageView = [[UIImageView alloc]init];
    imageView.backgroundColor=[UIColor purpleColor];
    imageView.userInteractionEnabled = YES;
    imageView.top = 0;
    imageView.left = 0;
    imageView.width = self.view.width;
    imageView.height = KTopImageScrollViewHeight;
    [topView addSubview:imageView];
    
    self.carousel =[[XRCarouselView alloc] initWithFrame:CGRectMake(0, 0, imageView.width, imageView.height)];
    //用代理处理图片点击
    self.carousel.delegate = self;
    //设置每张图片的停留时间，默认值为5s，最少为2s
    self.carousel.time = 3;
    UIColor *backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    UIFont *font = [UIFont systemFontOfSize:14];
    UIColor *textColor = [UIColor whiteColor];
    [ self.carousel setDescribeTextColor:textColor font:font bgColor:backgroundColor];
    self.carousel.pagePosition=PositionCustom;
    self.carousel.placeholderImage = [UIImage imageNamed:@"默认图"];
    [self loadBannerImageFromCache];
    [imageView addSubview:self.carousel];

    return topView;
}
-(void)loadBannerImageFromCache
{
    NSString *  cache = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"XRCarousel"];
    NSFileManager *fileManager;
    fileManager=[[NSFileManager alloc]init];
    NSArray * imageArr=[fileManager directoryContentsAtPath:cache];
    [self.imageArray addObjectsFromArray:imageArr];
    self.carousel.imageArray = self.imageArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma -mark tableView datasource and delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

-(void) initBlankDataLab {
    float headerHeight=self.tableView.tableHeaderView.frame.size.height;
    [blankDataLab removeFromSuperview];
    blankDataLab=nil;
    blankDataLab=[MCStateView emptyMessageViewWithFrame:CGRectMake(0, headerHeight, MC_SCREEN_WIDTH, self.tableView.frame.size.height-headerHeight) withString:@"暂无更多内容" andimageStr:@"ic_null"];
    [blankDataLab setHidden:NO];
    [self.tableView addSubview:blankDataLab];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecommendCourseListCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   
    return cell;
}


#pragma mark- KVO response
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    [SVProgressHUD dismiss];
    [self stopRefreshLoadMore];;
}

-(void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index
{
    
}

@end

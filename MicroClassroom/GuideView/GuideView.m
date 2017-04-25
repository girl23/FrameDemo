//
//  GuideView.m
//  MicroClassroom
//
//  Created by chenyongkang on 15/10/20.
//  Copyright (c) 2015年 FeiGuangpu. All rights reserved.
//

#import "GuideView.h"

@interface GuideView ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIPageControl *myPageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIButton *userNowBtn;

- (IBAction)useNow:(id)sender;

@end

@implementation GuideView

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.userNowBtn.hidden=YES;
    // Do any additional setup after loading the view from its nib.
    self.myScrollView.contentSize=CGSizeMake(4*[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    _myScrollView.delegate=self;
    
    self.myPageControl.numberOfPages=4;
    self.myPageControl.currentPage=0;
    self.myScrollView.pagingEnabled=YES;
    self.myScrollView.scrollEnabled=YES;
    
    for (int i=1; i<=4; i++) {
        UIImageView*imageView=[[UIImageView alloc] initWithFrame:CGRectMake((i-1)*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"guide_%d.png",i]];
        imageView.contentMode=UIViewContentModeScaleAspectFill;
        imageView.image=image;
//        if(i==4){
//            self.userNowBtn.hidden=NO;
//        }
        [self.myScrollView addSubview:imageView];
    }
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int index=fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
    
    if (index==3) {
        _userNowBtn.hidden=NO;
    }else{
        _userNowBtn.hidden=YES;
    }
    _myPageControl.currentPage=index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self=[super initWithCoder:aDecoder]) {
        
        self=[[[NSBundle mainBundle] loadNibNamed:@"GuideView" owner:nil options:nil] lastObject];
    }
    return self;
}

- (IBAction)useNow:(id)sender {
     //代理预判
    [self.delegate guideViewClickUseNowWithSelf:self];
}

- (BOOL)shouldAutorotate{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end

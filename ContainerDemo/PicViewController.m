//
//  PicViewController.m
//  SinaNews
//
//  Created by qianfeng on 15-6-14.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import "PicViewController.h"

@interface PicViewController ()

@end

@implementation PicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self creatSegmentControl];
    [self creatScrollView];
}
- (void)creatScrollView {
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,45, kScreenSize.width, kScreenSize.height-49-45)];
    self.found = [[FoundViewController alloc]init];
    [self.found willMoveToParentViewController:self];
    self.found.view.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self.scrollView addSubview:self.found.view];
    [self.found didMoveToParentViewController:self];
    
    self.recommend = [[RecommendViewController alloc]init];
    [self.recommend willMoveToParentViewController:self];
    self.recommend.view.frame = CGRectMake(kScreenSize.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self.scrollView addSubview:self.recommend.view];
    [self.recommend didMoveToParentViewController:self];
    
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(2*kScreenSize.width,0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
}
- (void)creatSegmentControl {
    NSArray *titles = @[@"发现",@"推荐"];
    self.seg = [[UISegmentedControl alloc]initWithItems:titles];
    self.seg.frame = CGRectMake(kScreenSize.width/2-40, 20, 80, 20);
    self.seg.selectedSegmentIndex = 0;
    self.seg.clipsToBounds = YES;
    self.seg.tintColor = [UIColor redColor];
#pragma mark - 圆角
    self.seg.layer.masksToBounds = YES;
    self.seg.layer.cornerRadius = 10;
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor redColor]};
    
    [self.seg setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    //增加事件
    [self.seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.seg];
}
- (void)segClick:(UISegmentedControl *)seg {
    self.scrollView.contentOffset = CGPointMake(seg.selectedSegmentIndex*kScreenSize.width,0);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.seg.selectedSegmentIndex = scrollView.contentOffset.x/kScreenSize.width;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end

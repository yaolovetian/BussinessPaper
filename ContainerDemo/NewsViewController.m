//
//  NewsViewController.m
//  SinaNews
//
//  Created by qianfeng on 15-6-14.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import "NewsViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SearchViewController.h"
#import "ContainerViewController.h"


@interface NewsViewController ()


@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViewControllers];
    [self creatSeachItem];
}
- (void)creatSeachItem {
    UIBarButtonItem *search = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed: @"sou"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(searchClick:)];
    self.navigationItem.leftBarButtonItem = search;
}
- (void)searchClick:(UIBarButtonItem *)item {
    SearchViewController *searchController = [[SearchViewController alloc]init];
    searchController.title = @"搜索";
    searchController.navigationItem.leftBarButtonItem = nil;
    [self.navigationController pushViewController:searchController animated:YES];
}

- (void)creatViewControllers {
    FirstViewController *first = [[FirstViewController alloc]init];
    first.title = @"精选";
    first.category = kjingxuan;
    SecondViewController *second = [[SecondViewController alloc]init];
    second.title = @"人物";
    second.category = krenwu;
    ThirdViewController *third = [[ThirdViewController alloc]init];
    third.title = @"事件";
    third.category= kshijian;
    FourthViewController *fourth = [[FourthViewController alloc]init];
    fourth.title = @"酷评";
    fourth.category = kkuping;
    FifthViewController *fifth = [[FifthViewController alloc]init];
    fifth.title = @"学院";
    fifth.category = kschool;
    
    ContainerViewController *container = [[ContainerViewController alloc]init];
    container.viewControllers = @[first,second,third,fourth,fifth];
    
    [self.view addSubview:container.view];
    
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

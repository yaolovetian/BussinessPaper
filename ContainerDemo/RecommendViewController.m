//
//  RecommendViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-17.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 //   self.view.backgroundColor = [UIColor redColor];
    self.category = @"Hot";
    [self firstDownload];
    [self creatRefreshView];
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

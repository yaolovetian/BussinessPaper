//
//  FoundViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-17.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "FoundViewController.h"


@interface FoundViewController ()

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.view.backgroundColor = [UIColor greenColor];
    self.category = @"Found";
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

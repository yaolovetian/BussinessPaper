//
//  FirstViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15/3/3.
//  Copyright (c) 2015年 WeiZhenLiu. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () 

@end

@implementation FirstViewController

- (void)viewWillShow {
 //   NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstDownload];
    [self creatRefreshView];
    
}

@end

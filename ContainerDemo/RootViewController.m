//
//  RootViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "RootViewController.h"

#import "BaseViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatControllers];
}
- (void)creatControllers {
    NSArray *titleNames = @[@"新闻",@"发现",@"招商",@"我的"];
    NSArray *controllerNames = @[@"NewsViewController",@"PicViewController",@"VideoViewController",@"MineViewController"];
    NSArray *imageNames = @[@"tabbar_news",@"tabbar_picture",@"tabbar_video",@"tabbar_setting"];
    NSMutableArray *VCArr = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < controllerNames.count; i++) {
        Class cls = NSClassFromString(controllerNames[i]);
        BaseViewController *BVC = [[cls alloc]init];
        
        UINavigationController *nac = [[UINavigationController alloc]initWithRootViewController:BVC];
        BVC.title = titleNames[i];
        nac.tabBarItem.image = [[UIImage imageNamed:imageNames[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nac.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_hl",imageNames[i]]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [VCArr addObject:nac];
    }
    self.viewControllers = VCArr;
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

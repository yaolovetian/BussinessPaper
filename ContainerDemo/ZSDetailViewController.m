//
//  ZSDetailViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15/6/22.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "ZSDetailViewController.h"

@interface ZSDetailViewController ()
{
    UIToolbar *toolBar;
}
@end

@implementation ZSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"项目介绍";
    [self.tabBarController.tabBar setHidden:YES];
    [self creatWebView];
}
- (void)creatWebView {
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height)];
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URL]]];
    [self.view addSubview:web];
    
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,kScreenSize.height-50,kScreenSize.width,50)];
    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [toolBar setBarTintColor:[UIColor blackColor]];
    [self.view addSubview:toolBar];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(2, 5, kScreenSize.width/3+20, 40);
    [button setTitle:@"电话咨询" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:button];
}
-(void)btnClick:(UIButton *)button {
    NSLog(@"xxxxxxxxx");
    //ios8变成了一个视图控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:self.tel preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertControllerStyleAlert  区分 是哪一类
    //UIAlertControllerStyleActionSheet
    
    //增加按钮事件
    /*
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,//取消
     UIAlertActionStyleDestructive//有危险操作
     */
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //NSLog(@"取消按钮被点击");
    }]];
    //确定按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *telStr = [NSString stringWithFormat:@"tel://%@",self.tel];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:telStr]];
    }]];
    //把视图控制器模态跳转出来
    [self presentViewController:alert animated:YES completion:nil];
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

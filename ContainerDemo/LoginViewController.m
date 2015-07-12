//
//  LoginViewController.m
//  ContainerDemo
//
//  Created by qianfeng001 on 15-7-7.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)missPasswdClick:(id)sender {
}

- (IBAction)registerClick:(id)sender {
    RegisterViewController *regist = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
}
@end

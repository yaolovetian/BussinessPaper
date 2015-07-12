//
//  RegisterViewController.m
//  ContainerDemo
//
//  Created by qianfeng001 on 15-7-7.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface RegisterViewController ()
- (IBAction)registerClick:(id)sender;
- (IBAction)getCodeClick:(id)sender;
- (IBAction)backLoginClick:(id)sender;

@end

@implementation RegisterViewController

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

- (IBAction)registerClick:(id)sender {
}

- (IBAction)getCodeClick:(id)sender {
}

- (IBAction)backLoginClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end

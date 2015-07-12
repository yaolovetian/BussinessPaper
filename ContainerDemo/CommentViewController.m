//
//  CommentViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15/6/19.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()<UITextFieldDelegate>
{
    UIToolbar *toolBar;
}
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.navigationController setToolbarHidden:NO animated:YES];
    [self creatWebView];
    [self creatToolBar];
}
- (void)creatWebView {
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, kScreenSize.width, kScreenSize.height-69)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.commentURL]]];
    [self.view addSubview:webView];
}
- (void)creatToolBar {
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,kScreenSize.height-49,kScreenSize.width,49)];
    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    toolBar.backgroundColor = [UIColor whiteColor];
    
    UIButton *back= [UIButton buttonWithType:UIButtonTypeSystem];
    back.frame = CGRectMake(5, 13, 20, 20);
    [back setBackgroundImage:[UIImage imageNamed:@"news_01"] forState:UIControlStateNormal];
    back.tag = 101;
    [back addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:back];
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(40, 13, 200, 20)];
    text.placeholder = @"说点什么吧";
    text.font = [UIFont systemFontOfSize:12];
    text.borderStyle = UITextBorderStyleLine;
    text.borderStyle = UITextBorderStyleBezel;
    text.borderStyle = UITextBorderStyleRoundedRect;
    text.delegate = self;
    [toolBar addSubview:text];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(260, 13, 40, 20);
    button.backgroundColor = [UIColor redColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 102;
    [toolBar addSubview:button];
    
    [self.view addSubview:toolBar];
}
- (void)btnClick:(UIButton *)button {
    switch (button.tag) {
        case 101:
        {
            [self dismissViewControllerAnimated:NO completion:nil];
        }
            break;
        case 102:
        {
            
        }
            break;
            
        default:
            break;
    }
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        toolBar.frame = CGRectMake(0, 250, self.view.frame.size.width, self.view.frame.size.height);
    }];
    return YES;
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

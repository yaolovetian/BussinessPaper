//
//  SearchViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-16.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed: @"dismiss"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = btnItem;
    [self creatUI];
    [self.dataArr removeAllObjects];
    CGRect frame = self.tableView.frame;
    frame = CGRectMake(0, 40, kScreenSize.width, kScreenSize.height-40);
    self.tableView.frame = frame;
    [self.tableView reloadData];
    
}
- (void)back:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)creatUI {
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,64, kScreenSize.width, 30)];
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
}
#pragma mark - UISearchBarDelegate
////将要开始进入编辑模式的时候调用
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
//    //显示 cancel 按钮
//    [searchBar setShowsCancelButton:NO animated:YES];
//    return YES;
//}
////结束编辑模式调用
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
//    //隐藏 cancel
//    [searchBar setShowsCancelButton:NO animated:YES];
//    return YES;
//}
//点击cancel 按钮调用
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    //收键盘
    [searchBar resignFirstResponder];
    //把searchBar的内容 清空
    searchBar.text = @"";
}
//点击 search 按钮的时候调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%@",@"我");
    [searchBar resignFirstResponder];
    [self.dataArr removeAllObjects];
    
    self.category = self.searchBar.text;
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

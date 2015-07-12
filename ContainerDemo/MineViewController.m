//
//  MineViewController.m
//  ContainerDemo
//
//  Created by qianfeng001 on 15-7-7.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "MineViewController.h"
//#import "MineCellOne.h"
//#import "MineCellTwo.h"
//#import "MineCellThree.h"
//#import "MineCellFour.h"
//#import "MineCellFive.h"
#import "MineCellSix.h"
#import "TopCell.h"
#import "CollectViewController.h"
//#import "LoginViewController.h"
#import "SettingViewController.h"
//#import "PayViewController.h"

@interface MineViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
}

- (void)creatTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    [self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1"]]];
   [self.tableView registerNib:[UINib nibWithNibName:@"MineCellSix" bundle:nil] forCellReuseIdentifier:@"MineCellSix"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TopCell" bundle:nil] forCellReuseIdentifier:@"TopCell"];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            TopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell"];
            cell.backgroundColor = [UIColor clearColor];
          //  cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 1:
        {
            MineCellSix *six = [tableView dequeueReusableCellWithIdentifier:@"MineCellSix"];
            six.backgroundColor = [UIColor clearColor];
        //    six.selectionStyle = UITableViewCellSelectionStyleNone;
            return six;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }else {
        return 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        SettingViewController *set = [[SettingViewController alloc]init];
        [self.navigationController pushViewController:set animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return nil;
    }
    return indexPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

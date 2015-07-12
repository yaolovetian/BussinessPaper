//
//  SettingViewController.m
//  SinaNews
//
//  Created by qianfeng on 15-6-14.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import "CollectViewController.h"
#import "LZXHelper.h"
#import "DataManager.h"
#import "SCCell.h"
#import "DetailViewController.h"
#import "JHMenuTableView.h"


@interface CollectViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSArray *actions;

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"收藏";
    [self creatTableView];
    
    [self showUI];
    [self creatDelete];
}

- (void) creatDelete {
    [self.tableView openJHTableViewMenu];
    JHMenuAction *action3 = [[JHMenuAction alloc] init];
    action3.title = @"删除";
    action3.titleColor = [UIColor whiteColor];
    action3.backgroundColor = JHRGBA(250, 88, 89, 1);
    action3.actionBlock = ^(JHMenuTableViewCell *cell, NSIndexPath *indexPath){
        JHLog(@"删除:%@,row:%ld",cell,indexPath.row);
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    self.actions = @[action3];
}

- (void)itemClick:(UIBarButtonItem *)item {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定" message:@"你确定要清空文件夹吗" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.dataArr removeAllObjects];
        [[DataManager sharedInstance]deleteAll];
        [self.tableView reloadData];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}

- (void)showUI {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"trash"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    self.dataArr = (NSMutableArray *)[[DataManager sharedInstance]readAllModel];

}

- (void)creatTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenSize.width, kScreenSize.height-64-49) style:UITableViewStylePlain];
    self.tableView.rowHeight = 60;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"SCCell" bundle:nil] forCellReuseIdentifier:@"SCCell"];
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCCell" forIndexPath:indexPath];
    ContentModel *model = self.dataArr[indexPath.row];
    cell.actions =  self.actions;
    [cell showModelWithModel:model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContentModel *model = self.dataArr[indexPath.row];
    DetailViewController *detail = [[DetailViewController alloc]init];
    detail.detailURL = model.url;
    [self.view.window.rootViewController presentViewController:detail animated:YES completion:nil];
}

#pragma mark - TableView的编辑
//1.打开整个TableView编辑状态
//UIViewController 自带的编辑按钮 会触发
//子类重写之后 可以控制
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

//2.控制 TableView对 指定cell 的编辑
#pragma mark - 实现 关于编辑的协议方法
//2.1 指定cell 是否可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//2.2设置指定分区指定行的cell 的编辑类型
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
//2.3 处理编辑操作

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
        {
            ContentModel *model  = self.dataArr[indexPath.row];
            [self.dataArr removeObjectAtIndex:indexPath.row];
            [[DataManager sharedInstance]deleteModelForId:model.contentId];
            self.title = [NSString stringWithFormat:@"-共%ld条-",self.dataArr.count];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
            
        }
            break;
        default:
            break;
    }
}

//更改删除编辑时候的标题
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
//开启向左滑动显示删除功能
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

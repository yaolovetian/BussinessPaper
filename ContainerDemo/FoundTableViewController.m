//
//  FoundTableViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15/6/19.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "FoundTableViewController.h"
#import "DetailViewController.h"

@interface FoundTableViewController ()

@end

@implementation FoundTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [[NSMutableArray alloc]init];
    self.manager = [AFHTTPRequestOperationManager manager];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"FoundCell" bundle:nil] forCellReuseIdentifier:@"FoundCell"];
    self.tableView.rowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoundCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoundCell" forIndexPath:indexPath];
    Found *model = self.dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detail = [[DetailViewController alloc]init];
    ContentModel *model = self.dataArr[indexPath.row];
    detail.conModel = model;
    detail.catid = model.catid;
    detail.contentId = model.contentId;
    detail.detailURL = model.url;
    [self.view.window.rootViewController presentViewController:detail animated:NO completion:nil];
}
#pragma mark - 如果不满足子类 那么子类要重写
//第一次下载
-(void)firstDownload {
    self.p = 1;
    self.isRefreshing = NO;
    self.isLoadMoring = NO;
    [self addTaskUrl:self.requestUrl isRefresh:YES];
}
-(void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh {
    url = [NSString stringWithFormat:kFoundURL,self.category,self.p];
    __weak typeof(self) weakSelf = self;
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *dataArr = dict[@"data"];
            for (NSDictionary *itemDict in dataArr) {
                Found *model = [[Found alloc]init];
                model.contentId = itemDict[@"id"];
                [model setValuesForKeysWithDictionary:itemDict];
                [weakSelf.dataArr addObject:model];
            }
            [self.tableView reloadData];
            [weakSelf endRefreshing];
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - 刷新
//刷新
- (void)creatRefreshView {//在子类中调用 如果不适合子类那么重写
     __weak typeof(self) weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.p = 1;
        weakSelf.isRefreshing = YES;
        
        [weakSelf addTaskUrl:weakSelf.requestUrl isRefresh:YES];
    }];
    
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        //上拉加载更多
        if (weakSelf.isLoadMoring) {
            return ;
        }
        weakSelf.isLoadMoring = YES;
        weakSelf.p++;
        [weakSelf addTaskUrl:weakSelf.requestUrl isRefresh:YES];
    }];
}
//结束刷新
- (void)endRefreshing {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    if (self.isLoadMoring) {
        self.isLoadMoring = NO;
        [self.tableView footerEndRefreshing];
    }
}
@end

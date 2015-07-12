//
//  VideoViewController.m
//  SinaNews
//
//  Created by qianfeng on 15-6-14.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import "VideoViewController.h"
#import "SubViewController.h"

@interface VideoViewController ()



@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
    [self firstDownload];
    [self creatRefreshView];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:NO];
}
- (void)creatTableView {
    self.imageArr = [[NSMutableArray alloc]init];
    self.dataArr = [[NSMutableArray alloc]init];
    self.manager = [AFHTTPRequestOperationManager manager];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenSize.width, kScreenSize.height-64-49) style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:kCELLID bundle:nil] forCellReuseIdentifier:kCELLID];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
  //  self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.rowHeight = 80;
    [self.view addSubview:self.tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZSCell *cell = [tableView dequeueReusableCellWithIdentifier:kCELLID forIndexPath:indexPath];
    ZSContentModel *model = self.dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}

#pragma mark setTitle

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZSContentModel *model = self.dataArr[indexPath.row];
    ZSDetailViewController *detail = [[ZSDetailViewController alloc]init];
    detail.URL = model.url;
    detail.tel = model.xmtel;
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark - 如果不满足子类 那么子类要重写
//第一次下载
-(void)firstDownload {
    self.currentPage = 1;
    self.isRefreshing = NO;
    self.isLoadMore = NO;
    [self addTaskUrl:self.requestUrl isRefresh:YES];
}
-(void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh {
    url = @"http://ksjv2.kanshangjie.com/Jiameng/Item?p=1&top=1";
    __weak typeof(self) weakSelf = self;
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDict = dict[@"data"];
            
            NSArray *contentArr = dataDict[@"content"];
            for (NSDictionary *itemDict in contentArr) {
                ZSContentModel *model = [[ZSContentModel alloc]init];
                model.ZSdescription = itemDict[@"description"];
                [model setValuesForKeysWithDictionary:itemDict];
                [weakSelf.dataArr addObject:model];
            }
            NSArray *topArr = dataDict[@"top"];
            for (NSDictionary *itemDict in topArr) {
                ZSTopModel *model = [[ZSTopModel alloc]init];
                model.topID = itemDict[@"id"];
                [model setValuesForKeysWithDictionary:itemDict];
                [weakSelf.imageArr addObject:model];
            }
            [self creatScrollView];
            [self.tableView reloadData];
            [weakSelf endRefreshing];
        }
     }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (void)creatScrollView {
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 150)];
    for (NSInteger i = 0; i < self.imageArr.count; i++) {
        ZSTopModel *model = self.imageArr[i];
        NSString *imageURL = model.thumb;
        LZXCustomImageView2 *imageView = [[LZXCustomImageView2 alloc]initWithFrame:CGRectMake(i*kScreenSize.width, 0, kScreenSize.width, 150)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        [imageView addTarget:self action:@selector(imageViewClick:)];
        imageView.tag = 100+i;
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(self.imageArr.count*kScreenSize.width, 150);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 338)];
    UIView *top_footView = [[UIView alloc]initWithFrame:CGRectMake(0, 130, self.imageArr.count*kScreenSize.width, 20)];
    top_footView.backgroundColor = [UIColor blackColor];
    top_footView.alpha = 0.3;
    [self.scrollView addSubview:top_footView];
    [topView addSubview:self.scrollView];
    
    NSArray *titles = @[@"建材",@"酒水",@"零售",@"金融",@"美食",@"家居",@"服装",@"更多精品"];
    CGFloat span = (kScreenSize.width-5*51)/5.0;
    for (NSInteger i = 1; i <= 8; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(span+span*((i-1)%4)+(i-1)%4*65, 155+(i-1)/4*72, 51, 51);
        if (kScreenSize.width == 320) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(span*((i-1)%4)+(i-1)%4*65, 155+(i-1)/4*72+51, 80, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.text = titles[i-1];
        [topView addSubview:label];
        }else if (kScreenSize.width == 375) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(span*((i-1)%4)+(i-1)%4*65+8, 155+(i-1)/4*72+51, 80, 20)];
            
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:14];
            label.text = titles[i-1];
            [topView addSubview:label];
        }
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(5,320 ,kScreenSize.width/2 , 20)];
        label1.text = @"热门项目推荐";
        [topView addSubview:label1];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"zs%02d",i]] forState:UIControlStateNormal];
        button.tag = 101+i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:button];
    }
    self.tableView.tableHeaderView = topView;
}
- (void)btnClick:(UIButton *)button {
    NSArray *titles = @[@"建材",@"酒水",@"零售",@"金融",@"美食",@"家居",@"服装",@"更多精品"];
    NSArray *cateid = @[@"3422",@"3425",@"3429",@"3431",@"3414",@"3418",@"3415",@""];
    NSInteger index = button.tag -102;
    SubViewController *sub = [[SubViewController alloc]init];
    sub.tit = titles[index];
    sub.cateid = cateid[index];
    sub.requestUrl = @"http://ksjv2.kanshangjie.com/Jiameng/Item?cateid=%@&order=0&p=1";
    [self.navigationController pushViewController:sub animated:YES];
    
}
- (void)imageViewClick:(LZXCustomImageView2 *)imageView {
    NSInteger index = imageView.tag-100;
    ZSTopModel *model = self.imageArr[index];
    ZSDetailViewController *detail = [[ZSDetailViewController alloc]init];
    detail.URL = model.url;
    detail.tel = model.xmtel;
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark - 刷新
//刷新
- (void)creatRefreshView {//在子类中调用 如果不适合子类那么重写
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.currentPage = 1;
        weakSelf.isRefreshing = YES;
        [weakSelf addTaskUrl:weakSelf.requestUrl isRefresh:YES];
    }];
    if ([self.cateid isEqualToString:@""]) {
        self.requestUrl = @"http://ksjv2.kanshangjie.com/Jiameng/Item?cateid=%@&order=0&p=%d";
        [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
            //上拉加载更多
            if (weakSelf.isLoadMore) {
                return ;
            }
            weakSelf.isLoadMore = YES;
            weakSelf.currentPage++;
            [weakSelf addTaskUrl:weakSelf.requestUrl isRefresh:YES];
        }];
    }
}
//结束刷新
- (void)endRefreshing {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    if (self.isLoadMore) {
        self.isLoadMore= NO;
        [self.tableView footerEndRefreshing];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

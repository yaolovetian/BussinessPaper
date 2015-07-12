//
//  SubBaseViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "SubBaseViewController.h"
#import "DetailViewController.h"

#define kKSJCell @"KSJCell"

@interface SubBaseViewController ()

@end

@implementation SubBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
    self.manager = [AFHTTPRequestOperationManager manager];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}
#pragma  mark - tableView
- (void)creatTableView {
    self.topArr = [[NSMutableArray alloc]init];
    self.dataArr = [[NSMutableArray alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-40-44-49) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
  //  self.tableView.rowHeight = 80;
    [self.tableView registerNib:[UINib nibWithNibName:kKSJCell bundle:nil] forCellReuseIdentifier:kKSJCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"FoundCell" bundle:nil] forCellReuseIdentifier:@"FoundCell"];
    [self.view addSubview:self.tableView];
}
#pragma mark - tableView协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSJCell *cell = [tableView dequeueReusableCellWithIdentifier:kKSJCell forIndexPath:indexPath];
    ContentModel *model = self.dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detail = [[DetailViewController alloc]init];
    ContentModel *model = self.dataArr[indexPath.row];
    detail.conModel = model;
    detail.contentId = model.contentId;
    detail.catid = model.catid;
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
    __weak typeof(self) weakSelf = self;
    NSArray *categoryArr = @[kjingxuan,krenwu,kshijian,kkuping,kschool];
    if ([categoryArr containsObject:self.category]) {
        url = [NSString stringWithFormat:kURL,self.p,self.category];
        [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (responseObject) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSDictionary *dataDict = dict[@"data"];
                NSArray *topArr = dataDict[@"top"];
                NSArray *contentArr = dataDict[@"content"];
                //contentId=?,title=?,thumb=?,url=?,inputtime=?,catid=?,contentDescription=?,comment;
                for (NSDictionary *itemDict in contentArr) {
                    ContentModel *model = [[ContentModel alloc]init];
                    model.contentId = itemDict[@"id"];
                    model.title = itemDict[@"title"];
                    model.thumb = itemDict[@"thumb"];
                    model.url = itemDict[@"url"];
                    model.inputtime = itemDict[@"inputtime"];
                    model.catid = itemDict[@"catid"];
                    model.contentDescription = itemDict[@"description"];
                    NSNumber *com = itemDict[@"comment"];
                    model.comment = [com stringValue];
                    [weakSelf.dataArr addObject:model];
                }
                [weakSelf.topArr removeAllObjects];
                for (NSDictionary *topDict in topArr) {
                    TopModel *model = [[TopModel alloc]init];
                    model.contentid = topDict[@"id"];
                    [model setValuesForKeysWithDictionary:topDict];
                    [weakSelf.topArr addObject:model];
                }
                [self creatScrollView];
                [self.tableView reloadData];
                [weakSelf endRefreshing];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //下载失败
        }];
    }
    else {
        url = [NSString stringWithFormat:kSearchURL,self.category,self.p];
        [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (responseObject) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSDictionary *dataArr = dict[@"data"];
                for (NSDictionary *itemDict in dataArr) {
                    ContentModel *model = [[ContentModel alloc]init];
                    model.contentId = itemDict[@"id"];
                    model.contentDescription = itemDict[@"description"];
                    [model setValuesForKeysWithDictionary:itemDict];
                    [weakSelf.dataArr addObject:model];
                }
                [self.tableView reloadData];
                [weakSelf endRefreshing];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //下载失败
        }];
        
    }
    
    
}
#pragma mark - 创建top滚动视图
- (void)creatScrollView {
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, kScreenSize.width, 160)];
    for (NSInteger i = 0; i < self.topArr.count; i++) {
        LZXCustomImageView2 *imgView = [[LZXCustomImageView2 alloc]initWithFrame:CGRectMake(i*kScreenSize.width, 0, kScreenSize.width, 160)];
        imgView.tag = 301+i;
        [imgView addTarget:self action:@selector(photoTapped:)];
        
        TopModel *model = self.topArr[i];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,140, kScreenSize.width, 20)];
        label.backgroundColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor whiteColor];
        label.text = model.title;
        NSString *imageStr = model.thumb;
        [imgView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed: @"placeholderImage"]];
        [imgView addSubview:label];
        [self.scrollView addSubview:imgView];
    }
    self.scrollView.delegate                       = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator   = NO;
    self.scrollView.bounces                        = NO;
    self.scrollView.pagingEnabled                  = YES;
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    self.scrollView.contentSize = CGSizeMake(self.topArr.count*kScreenSize.width, 100);
    
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenSize.width-100, 140, 80, 20)];
    _pageControl.numberOfPages = self.topArr.count;
    
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    [_pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    //[self.view addSubview:self.scrollView];
    
    self.tableView.tableHeaderView = self.scrollView;
    [self.tableView addSubview:_pageControl];
    
}
-(void) photoTapped: (LZXCustomImageView2 *)imageView{
    
    TopModel *model = self.topArr[imageView.tag - 301];
    DetailViewController *detail = [[DetailViewController alloc]init];
    
    detail.detailURL = [NSString stringWithFormat:kDetailURL,model.catid,model.contentid];
    self.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:detail animated:YES completion:nil];
    
}
- (void)pageClick:(UIPageControl *)page {
    //修改滚动视图的偏移量
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width*page.currentPage, 0) animated:YES];
}
//减速停止的时候
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //修改页码
    CGPoint offset = _scrollView.contentOffset;
    _pageControl.currentPage = offset.x/_scrollView.bounds.size.width;
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

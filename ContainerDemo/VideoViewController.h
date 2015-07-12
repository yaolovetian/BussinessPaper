//
//  VideoViewController.h
//  SinaNews
//
//  Created by qianfeng on 15-6-14.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import "BaseViewController.h"
#import "ZSTopModel.h"
#import "ZSContentModel.h"
#import "ZSCell.h"
#import "ZSCategoryModel.h"
#import "AFNetworking.h"
#import "JHRefresh.h"
#import "ZSDetailViewController.h"
#import "LZXCustomImageView2.h"
#import "UIImageView+WebCache.h"

#define kCELLID @"ZSCell"
@interface VideoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic)NSMutableArray *dataArr;
@property (nonatomic,strong)AFHTTPRequestOperationManager *manager;
@property (nonatomic)BOOL isRefreshing;
@property (nonatomic)BOOL isLoadMore;
@property (nonatomic)NSInteger currentPage;
@property (nonatomic,copy)NSString *requestUrl;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,copy)NSString *cateid;

@property (nonatomic,strong)NSMutableArray *imageArr;
@property (nonatomic,strong)NSMutableArray *scrollArr;

#pragma mark - 如果不满足子类 那么子类要重写
//第一次下载
- (void)firstDownload;
//增加下载任务
- (void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh;

//刷新
- (void)creatRefreshView;
//结束刷新
- (void)endRefreshing;

@end

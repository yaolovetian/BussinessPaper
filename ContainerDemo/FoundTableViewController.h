//
//  FoundTableViewController.h
//  ContainerDemo
//
//  Created by qianfeng on 15/6/19.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "JHRefresh.h"
#import "Found.h"
#import "FoundCell.h"

@interface FoundTableViewController : UITableViewController

@property (nonatomic,copy)NSString *category;
@property (nonatomic,copy)NSString *requestUrl;
@property (nonatomic,assign)NSInteger p;
@property (nonatomic,strong)AFHTTPRequestOperationManager *manager;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic)BOOL isRefreshing;
@property (nonatomic)BOOL isLoadMoring;

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

//
//  SubBaseViewController.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "KSJCell.h"
#import "ContentModel.h"
#import "TopModel.h"
#import "JHRefresh.h"
#import "UIImageView+WebCache.h"
#import "LZXCustomImageView2.h"

@interface SubBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    UIPageControl *_pageControl;
    //当前页
    NSInteger _p;
    BOOL _isRefreshing;
    BOOL _isLoadMoring;
    
    AFHTTPRequestOperationManager *_manager;
}

@property (nonatomic,copy)NSString *category;
@property (nonatomic)NSInteger p;
@property (nonatomic,copy)NSString *catid;
@property (nonatomic,copy)NSString *contentId;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic)BOOL isRefreshing;
@property (nonatomic)BOOL isLoadMoring;
@property (nonatomic,strong)AFHTTPRequestOperationManager *manager;
@property (nonatomic,copy)NSString *requestUrl;
@property (nonatomic,strong)NSMutableArray *topArr;
@property (nonatomic,strong)UIScrollView *scrollView;
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
/*
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=&top=1
 http://ksjv2.kanshangjie.com/Category/Show?catid=475&id=54906&type=news
 */
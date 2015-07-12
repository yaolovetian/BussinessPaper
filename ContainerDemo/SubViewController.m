//
//  SubViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15/6/22.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "SubViewController.h"
#import "DOPDropDownMenu.h"
#import "ZSCategoryModel.h"

@interface SubViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>

@property (nonatomic, strong) NSMutableArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic, strong) NSArray *sorts;

@property (nonatomic,strong)AFHTTPRequestOperationManager *manager2;
@property (nonatomic,strong)NSMutableArray *categoryArr;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.categoryArr = [[NSMutableArray alloc]init];
    self.classifys = [[NSMutableArray alloc]init];
    self.manager2 = [AFHTTPRequestOperationManager manager];
    self.manager2.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.manager2 GET:@"http://ksjv2.kanshangjie.com/Jiameng/Category" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *dataArr = dict[@"data"];
            for (NSDictionary *itemDict in dataArr) {
                ZSCategoryModel *model = [[ZSCategoryModel alloc]init];
                model.descriptions = itemDict[@"description"];
                [model setValuesForKeysWithDictionary:itemDict];
               [self.classifys addObject:model.name];
                [self.categoryArr addObject:model];
            }
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    CGRect rect = self.tableView.frame;
    rect = CGRectMake(0,100, kScreenSize.width, kScreenSize.height-49-84);
    self.tableView.frame = rect;
    // Do any additional setup after loading the view, typically from a nib.
    self.title = self.tit;
    
    // 数据
    [self.classifys addObject:@"分类"];
    //[self.classifys addObject:@"全部分类"];
    self.areas = @[@"金额"];
    self.sorts = @[@"排序"];
    
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
    
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    
    //[self creatRefreshView];
}
-(void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh {
    url = [NSString stringWithFormat:self.requestUrl,self.cateid];
    if ([self.cateid isEqualToString:@""]) {
        url = [NSString stringWithFormat:self.requestUrl,self.cateid,self.currentPage];
    }
    __weak typeof(self) weakSelf = self;
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDict = dict[@"data"];
            
            NSArray *contentArr = dataDict[@"content"];
            for (NSDictionary *itemDict in contentArr) {
                ZSContentModel *model = [[ZSContentModel alloc]init];
                //model.ZSContentID = itemDict[@"id"];
                model.ZSdescription = itemDict[@"description"];
                [model setValuesForKeysWithDictionary:itemDict];
                
                [weakSelf.dataArr addObject:model];
            }
            
            [self.tableView reloadData];
            [weakSelf endRefreshing];
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.classifys.count;
    }else if (column == 1){
        return self.areas.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        NSString *cateid = self.classifys[indexPath.row];
        if (![cateid isEqualToString:@"分类"]) {
            
            self.title = cateid;
            ZSCategoryModel *model = [[ZSCategoryModel alloc]init];

            model = self.categoryArr[indexPath.row-1];
            self.cateid = model.cateid;
            if ([model.display isEqualToString:@"更多精品"]) {
                self.cateid = @"";
            }
            [self.dataArr removeAllObjects];
            [self addTaskUrl:self.requestUrl isRefresh:YES];
        }
        return cateid;
    } else if (indexPath.column == 1){
        return self.areas[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
            return self.cates.count;
        } else if (row == 2){
            return self.movices.count;
        } else if (row == 3){
            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            return self.cates[indexPath.item];
        } else if (indexPath.row == 2){
            return self.movices[indexPath.item];
        } else if (indexPath.row == 3){
            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
       
    }else {
   
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

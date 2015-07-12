//
//  SettingViewController.m
//  ContainerDemo
//
//  Created by qianfeng001 on 15-7-8.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "SettingViewController.h"
#import "MyControl.h"
#import "SDImageCache.h"
#import "CollectViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    UIView *_view;
}

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showUI];
}

- (void)showUI {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)style:UITableViewStylePlain];
    _tableView.scrollEnabled = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
  
    _dataArr = [[NSMutableArray alloc]init];
    _dataArr = [[NSMutableArray alloc]initWithObjects:@"清除缓存",@"收藏",nil];
   
  //  _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
     [_tableView setBackgroundView:imageView1];
   [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    

    cell.textLabel.text = _dataArr[indexPath.row];
    if (indexPath.row == 0) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
        label.textAlignment = NSTextAlignmentRight;
        label.text = [NSString stringWithFormat:@"%.3fM",[self getCacheSize]];
        label.backgroundColor = [UIColor clearColor];
        cell.accessoryView = label;
    }
    cell.backgroundColor = [UIColor clearColor];
 //   cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"清除" message:[NSString stringWithFormat:@"总共有%.3fM缓存",[self getCacheSize]] preferredStyle:UIAlertControllerStyleActionSheet];
            [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
             }]];
            __weak typeof (tableView)myTableView = tableView;
            __weak typeof(self)mySelf = self;
            [sheet addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                [[SDImageCache sharedImageCache]clearMemory];
                [[SDImageCache sharedImageCache]clearDisk];
                NSString *myChchepath = [NSHomeDirectory()stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
                [[NSFileManager defaultManager]removeItemAtPath:myChchepath error:nil];
                ((UILabel *)[myTableView cellForRowAtIndexPath:indexPath].accessoryView).text = [NSString stringWithFormat:@"%.3fM",[mySelf getCacheSize]];
            }]];
            [self presentViewController:sheet animated:YES completion:nil];
        }
            break;
        case 1:
        {
            CollectViewController *collect = [[CollectViewController alloc]init];
            [self.navigationController pushViewController:collect animated:YES];
        }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (CGFloat)getCacheSize {
    NSUInteger imageCacheSize = [[SDImageCache sharedImageCache]getSize];
    NSString *myCachePath = [NSHomeDirectory() stringByAppendingString:@"Library/Caches/MyCaches"];
    NSDirectoryEnumerator *enumertator = [[NSFileManager defaultManager]enumeratorAtPath:myCachePath];
    __block NSUInteger count = 0;
    for (NSString *fileName in enumertator) {
        NSString *path = [myCachePath stringByAppendingPathComponent:fileName];
        NSDictionary *fileDict = [[NSFileManager defaultManager]attributesOfItemAtPath:path error:nil];
        count += fileDict.fileSize;
    }
    CGFloat totalSize = ((CGFloat)imageCacheSize + count)/1024/1024;
    return totalSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

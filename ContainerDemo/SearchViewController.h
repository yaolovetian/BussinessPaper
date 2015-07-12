//
//  SearchViewController.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-16.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubBaseViewController.h"

@interface SearchViewController : SubBaseViewController<UISearchBarDelegate>
@property (nonatomic,strong)UISearchBar *searchBar;
@end

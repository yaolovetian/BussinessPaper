//
//  PicViewController.h
//  SinaNews
//
//  Created by qianfeng on 15-6-14.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoundViewController.h"
#import "RecommendViewController.h"

@interface PicViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
}
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UISegmentedControl *seg;
@property (nonatomic,strong)FoundViewController *found;
@property (nonatomic,strong)RecommendViewController *recommend;
@end

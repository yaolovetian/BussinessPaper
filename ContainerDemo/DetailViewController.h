//
//  DetailViewController.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-16.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocial.h"
#import "ContentModel.h"

@interface DetailViewController : UIViewController<UMSocialUIDelegate>
@property (nonatomic,copy)NSString *detailURL;
@property (nonatomic,copy)NSString *contentId;
@property (nonatomic,copy)NSString *catid;
@property (nonatomic,strong)ContentModel *conModel;
@end

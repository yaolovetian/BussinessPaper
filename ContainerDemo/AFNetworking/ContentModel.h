//
//  ContentModel.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "BaseModel.h"

@interface ContentModel : BaseModel
@property (nonatomic,copy)NSString *contentId;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *thumb;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *inputtime;
@property (nonatomic,copy)NSString *catid;
@property (nonatomic,copy)NSString *contentDescription;
@property (nonatomic,copy)NSString *comment;
@end

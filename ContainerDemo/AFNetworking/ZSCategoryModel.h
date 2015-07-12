//
//  ZSCategoryModel.h
//  ContainerDemo
//
//  Created by qianfeng on 15/6/19.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "BaseModel.h"

@interface ZSCategoryModel : BaseModel
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *parentid;
@property (nonatomic,copy)NSString *child;
@property (nonatomic,copy)NSString *keyid;
@property (nonatomic,copy)NSString *descriptions;
@property (nonatomic,copy)NSString *cateid;
@property (nonatomic,copy)NSString *display;
@end

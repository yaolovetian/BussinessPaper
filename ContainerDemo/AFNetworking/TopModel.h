//
//  TopModel.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "BaseModel.h"

@interface TopModel : BaseModel
@property (nonatomic,copy)NSString *contentid;
@property (nonatomic,copy)NSString *catid;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *thumb;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSNumber *favid;
@end

//
//  ZSContentModel.h
//  ContainerDemo
//
//  Created by qianfeng on 15/6/19.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "BaseModel.h"

@interface ZSContentModel : BaseModel

@property (nonatomic,copy)NSString *ZSContentID;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *ZSdescription;
@property (nonatomic,copy)NSString *thumb;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *inputtime;
@property (nonatomic,copy)NSString *catid;
@property (nonatomic,copy)NSString *xmtzje;
@property (nonatomic,copy)NSString *xmfenlei;
@property (nonatomic,copy)NSString *xmtel;
@property (nonatomic,copy)NSString *partner;
@property (nonatomic,copy)NSString *favorites;
@property (nonatomic,copy)id comment;
@property (nonatomic,copy)NSNumber *comments;
@property (nonatomic,copy)NSNumber *type;

@end
/*
 {
 "id": "48",
 "title": "卡撒天娇",
 "": "中国一二线市场的强势品牌",
 "": "http://www.kanshangjie.com/uploadfile/2015/0304/20150304034758525.jpg",
 "": "http://ksjv2.kanshangjie.com/Jiameng/Show?catid=3594&id=48",
 "": "1425454966",
 "": "3418",
 "": "20-50",
 "": "3418",
 "": "4007707099",
 "partner": "0",
 "favorites": 0,
 "comment": "2K+",
 "comments": 0,
 "type": 1
 }
 */
//
//  BaseModel.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

- (id)valueForUndefinedKey:(NSString *)key;
@end
/*
 top:
 "id": "54960",
 "catid": "1974",
 "title": "摸着自己的胸肌问自己：我们到底该不该装逼？",
 "thumb": "http://www.kanshangjie.com/uploadfile/2015/0615/20150615062801746.jpg",
 "url": "http://ksjv2.kanshangjie.com/Category/Show?catid=1974&id=54960",
 "favid": 0
 */
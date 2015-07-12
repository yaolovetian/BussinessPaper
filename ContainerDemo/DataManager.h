//
//  DataManager.h
//  TestModel
//
//  Created by qianfeng on 15/6/25.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "ContentModel.h"
#import "LZXHelper.h"

@interface DataManager : NSObject

@property (nonatomic)FMDatabase *dataBase;

+(instancetype)sharedInstance;

- (void)insertModel:(id)model;
- (void)deleteModelForId:(NSString *)contentId;
- (NSArray *)readAllModel;
- (BOOL)isExistAppForId:(NSString *)contentId;
- (NSInteger)getCounts;
- (void)deleteAll;

@end

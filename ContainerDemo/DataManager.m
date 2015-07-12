//
//  DataManager.m
//  TestModel
//
//  Created by qianfeng on 15/6/25.
//  Copyright (c) 2015年 wangruyi. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+(instancetype)sharedInstance {
    static DataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataManager alloc]init];
    });
    return manager;
}
//初始化
-(instancetype)init {
    if (self = [super init]) {
        NSString *filePath = [self getFileFullPathWithFileName:@"ksj.db"];
        self.dataBase = [[FMDatabase alloc]initWithPath:filePath];
        if ([self.dataBase open]) {
            [self creatTable];
        }else {
            NSLog(@"database open failed:%@",self.dataBase.lastErrorMessage);
        }
    }
    return self;
}
//获取文件的全路径
- (NSString *)getFileFullPathWithFileName:(NSString *)fileName {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    return [docPath stringByAppendingPathComponent:fileName];
  }
//创建表
/*
*contentId,title,thumb,url,inputtime,catid,contentDescription,comment;
 */
- (void)creatTable {
    NSString *sql = @"create table if not exists ksjInfo(serial integer Primary Key Autoincrement,contentId Varchar(255),title Varchar(255),thumb Varchar(255),url Varchar(255),inputtime Varchar(255),catid Varchar(255),contentDescription Varchar(255),comment Varchar(255))";
    BOOL isSuccees = [self.dataBase executeUpdate:sql];
    if (!isSuccees) {
    //    NSLog(@"createTable error:%@",self.dataBase.lastErrorMessage);
    }
}
//插入数据
- (void)insertModel:(id)model {
   // 需要进行形式的转化 上边是id类型 需要转化为自己需要的类型
    ContentModel *contentModel = (ContentModel *)model;
    if ([self isExistAppForId:contentModel.contentId]) {
   //     NSLog(@"this appModel has recorded");
        return;
    }
    NSString *sql = @"insert into ksjInfo(contentId,title,thumb,url,inputtime,catid,contentDescription,comment) values(?,?,?,?,?,?,?,?)";
    BOOL isSuccess = [self.dataBase executeUpdate:sql,contentModel.contentId,contentModel.title,contentModel.thumb,contentModel.url,contentModel.inputtime,contentModel.catid,contentModel.catid,contentModel.contentDescription,contentModel.comment ];
    if (!isSuccess) {
    //    NSLog(@"insert error:%@",self.dataBase.lastErrorMessage);
    }
}
- (void)deleteModelForId:(NSString *)contentId{
    NSString *sql = @"delete from ksjInfo where contentId = ?";
    BOOL isSuccess = [self.dataBase executeUpdate:sql,contentId];
    if (!isSuccess) {
       // NSLog(@"delete error:%@",self.dataBase.lastErrorMessage);
    }
}
- (NSArray *)readAllModel {
    NSString *sql = @"select * from ksjInfo";
    FMResultSet *rs = [self.dataBase executeQuery:sql];
    NSMutableArray *arr = [NSMutableArray array];
    while ([rs next]) {
        ContentModel *contentModel = [[ContentModel alloc]init];
        //因为id和description是系统的一些方法的关键字，所以需要自己写
        contentModel.contentId = [rs stringForColumn:@"contentId"];
        contentModel.title = [rs stringForColumn:@"title"];
        contentModel.thumb = [rs stringForColumn:@"thumb"];
        contentModel.url = [rs stringForColumn:@"url"];
        contentModel.inputtime = [rs stringForColumn:@"inputtime"];
        contentModel.catid = [rs stringForColumn:@"catid"];
        contentModel.contentDescription = [rs stringForColumn:@"contentDescription"];
        contentModel.comment = [rs stringForColumn:@"comment"];
        [arr addObject:contentModel];
    }
    return arr;
}


- (void)deleteAll {
    NSString *sql = @"delete from ksjInfo";
    BOOL isSuccess = [self.dataBase executeUpdate:sql];
    if (!isSuccess) {
        
    }


}
- (BOOL)isExistAppForId:(NSString *)contentId {
    NSString *sql = @"select * from ksjInfo where contentId = ?";
    FMResultSet *rs = [self.dataBase executeQuery:sql,contentId];
    if([rs next]) {
        return YES;
    }else {
        return NO;
    }
}
- (NSInteger)getCounts {
    
    NSString *sql = @"select count(*) from ksjInfo";
    FMResultSet *rs = [self.dataBase executeQuery:sql];
    NSInteger count = 0;
    while ([rs next]) {
        count = [[rs stringForColumnIndex:0] integerValue];
    }
    return count;
}

@end

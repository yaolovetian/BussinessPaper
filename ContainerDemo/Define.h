//
//  Define.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#ifndef ContainerDemo_Define_h
#define ContainerDemo_Define_h

#define kScreenSize [UIScreen mainScreen].bounds.size

#define kjingxuan @""
#define shangjiezaobao @"shangjiezaobao"
#define kfengchensanxia @"fengchensanxia"
#define krenwu @"renwu"
#define kshijian @"shijian"
#define kkuping @"kuping"
#define kschool @"school"
#define kbaiju @"baiju"
#define khongguan @"hongguan"
#define kxinrui @"xinrui"
#define kyingxiao @"yingxiao"
#define kzhihui @"zhihui"
#define kzhichang @"zhichang"
#define ktushuo @"tushuo"
#define kgushi @"gushi"
#define klicai @"licai"
#define kyingxiao @"yingxiao"

#define kURL @"http://ksjv2.kanshangjie.com/Category/News?p=%d&slug=%@&top=1"
#define kDetailURL @"http://ksjv2.kanshangjie.com/Category/Show?catid=%@&id=%@&type=news"
#define kSearchURL @"http://ksjv2.kanshangjie.com/Search/News?k=%@&p=%d"

#define kFoundURL @"http://ksjv2.kanshangjie.com/System/%@?p=%d"

/*
 搜索:
 http://ksjv2.kanshangjie.com/Search/News?k=%@&p=1
 精选:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=&top=1
 http://ksjv2.kanshangjie.com/Category/Show?catid=475&id=54906&type=news
 商界早报:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=shangjiezaobao&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=shangjiezaobao
 http://ksjv2.kanshangjie.com/Category/Show?catid=3649&id=53952&type=news
 风尘三侠:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=fengchensanxia&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=fengchensanxia
 http://ksjv2.kanshangjie.com/Category/Show?catid=3648&id=54120&type=news
 人物:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=renwu &top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=renwu
 http://ksjv2.kanshangjie.com/Category/Show?catid=475&id=54913&type=news
 事件:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=shijian&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=shijian
 http://ksjv2.kanshangjie.com/Category/Show?catid=2231&id=54915&type=news
 酷评:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=kuping&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=kuping
 http://ksjv2.kanshangjie.com/Category/Show?catid=2232&id=54688&type=news
 学院:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=school&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=school
 http://ksjv2.kanshangjie.com/Category/Show?catid=6&id=54782&type=news
 败局:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=baiju&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=baiju
 http://ksjv2.kanshangjie.com/Category/Show?catid=478&id=54240&type=news
 宏观:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=hongguan&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=hongguan
 http://ksjv2.kanshangjie.com/Category/Show?catid=476&id=54781&type=news
 新锐:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=xinrui&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=xinrui
 http://ksjv2.kanshangjie.com/Category/Show?catid=4&id=54905&type=news
 营销:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=yingxiao&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=yingxiao
 http://ksjv2.kanshangjie.com/Category/Show?catid=2233&id=54848&type=news
 智慧:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=zhihui&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=zhihui
 http://ksjv2.kanshangjie.com/Category/Show?catid=1974&id=54912&type=news
 职场:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=zhichang&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=zhichang
 http://ksjv2.kanshangjie.com/Category/Show?catid=2234&id=54895&type=news
 图说:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=tushuo&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=tushuo
 http://ksjv2.kanshangjie.com/Category/Show?catid=1975&id=54780&type=news
 故事:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=gushi&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=gushi
 http://ksjv2.kanshangjie.com/Category/Show?catid=1976&id=54852&type=news
 理财:
 http://ksjv2.kanshangjie.com/Category/News?p=1&slug=licai&top=1
 http://ksjv2.kanshangjie.com/Category/News?p=2&slug=licai
 http://ksjv2.kanshangjie.com/Category/Show?catid=3645&id=54900&type=news

 
 发现:
 http://ksjv2.kanshangjie.com/System/Found?p=1
 http://ksjv2.kanshangjie.com/System/Found?p=2
 http://ksjv2.kanshangjie.com/Comment/Attitude     catid=3650&d=1&id=54466
 http://ksjv2.kanshangjie.com/Comment/Add             cateid=3650&content=%24%24%24%24%24%24%24&id=54466
 推荐:
 http://ksjv2.kanshangjie.com/System/Hot?p=2
 http://ksjv2.kanshangjie.com/System/Hot?p=1
 http://ksjv2.kanshangjie.com/Category/Show?catid=475&id=54839&type=0
 */

#endif

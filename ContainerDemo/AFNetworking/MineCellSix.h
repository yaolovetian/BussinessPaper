//
//  MineCellSix.h
//  BussinessPaper
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 姚帅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^setBlock)();

@interface MineCellSix : UITableViewCell
- (IBAction)setClick:(id)sender;

@property (nonatomic,copy)setBlock myBlock;

@end

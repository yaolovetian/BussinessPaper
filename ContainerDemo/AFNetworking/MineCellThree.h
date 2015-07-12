//
//  MineCellThree.h
//  BussinessPaper
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 姚帅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^payBlock)();

@interface MineCellThree : UITableViewCell
- (IBAction)payClick:(id)sender;

@property (nonatomic,copy)payBlock myBlock;

@end

//
//  TopCell.h
//  BussinessPaper
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 姚帅. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^rigBlock)();

@interface TopCell : UITableViewCell

- (IBAction)regLogClick:(id)sender;

@property (nonatomic,copy)rigBlock myBlock;

@end

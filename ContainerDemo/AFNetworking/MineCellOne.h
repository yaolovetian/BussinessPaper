//
//  MineCellOne.h
//  BussinessPaper
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 姚帅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CollectBlock)();



@interface MineCellOne : UITableViewCell
- (IBAction)gradeClick:(id)sender;
- (IBAction)integrateClick:(id)sender;
- (IBAction)collectClick:(id)sender;
- (IBAction)commentClick:(id)sender;


@property (nonatomic,copy)CollectBlock myBlock;

@end

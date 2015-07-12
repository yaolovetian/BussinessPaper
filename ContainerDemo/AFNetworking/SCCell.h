//
//  SCCell.h
//  ContainerDemo
//
//  Created by qianfeng on 15/6/25.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentModel.h"
#import "JHMenuTableViewCell.h"

@interface SCCell : JHMenuTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

- (void)showModelWithModel:(ContentModel *)model;
@end

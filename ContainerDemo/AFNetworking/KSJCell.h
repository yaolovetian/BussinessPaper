//
//  KSJCell.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentModel.h"

@interface KSJCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *inputtimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
- (void)showDataWithModel:(ContentModel *)model;
@end

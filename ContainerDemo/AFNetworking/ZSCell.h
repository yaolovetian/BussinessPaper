//
//  ZSCell.h
//  ContainerDemo
//
//  Created by qianfeng on 15/6/19.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSContentModel.h"

@interface ZSCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *xmtzje;

- (void)showDataWithModel:(ZSContentModel *)model;
@end

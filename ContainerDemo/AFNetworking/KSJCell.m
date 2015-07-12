//
//  KSJCell.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-15.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "KSJCell.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"

@implementation KSJCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)showDataWithModel:(ContentModel *)model {
    self.titleLabel.text = model.title;
    self.descriptionLabel.text = model.contentDescription;
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed: @"placeholderImage"]];
        self.inputtimeLabel.hidden = YES;
        self.commentLabel.hidden = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

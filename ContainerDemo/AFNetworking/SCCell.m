//
//  SCCell.m
//  ContainerDemo
//
//  Created by qianfeng on 15/6/25.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "SCCell.h"
#import "LZXHelper.h"

@implementation SCCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)showModelWithModel:(ContentModel *)model {
    self.titleLabel.text = model.title;
    self.dateLabel.text = [LZXHelper dateStringFromNumberTimer:model.inputtime];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

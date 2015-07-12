//
//  ZSCell.m
//  ContainerDemo
//
//  Created by qianfeng on 15/6/19.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "ZSCell.h"
#import "UIImageView+WebCache.h"

@implementation ZSCell

- (void)awakeFromNib {
    
}
-(void)showDataWithModel:(ZSContentModel *)model {
    
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.titleLabel.text = model.title;
    self.commentLabel.text = [NSString stringWithFormat:@"%@",model.comment];
    self.descriptionLabel.text = model.ZSdescription;
    self.xmtzje.text = [NSString stringWithFormat:@"¥%@万",model.xmtzje];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

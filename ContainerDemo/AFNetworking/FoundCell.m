//
//  FoundCell.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-17.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "FoundCell.h"
#import "UIImageView+WebCache.h"

@implementation FoundCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)showDataWithModel:(Found *)model {
    self.titleLabel.text = model.title;
    if (model.nickname) {
        self.avatarImageView.layer.masksToBounds = YES;
        self.avatarImageView.layer.cornerRadius = 20;
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed: @"placeholderImage"]];
    }else {
        [self layoutIfNeeded];
        self.topConstraint.constant = 10;
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        [self.likeImage setHidden:YES];
    }
    self.likeLabel.text = @"赞";
    self.nicknameLabel.text = model.nickname;
    [self.commentButton setTitle:[NSString stringWithFormat:@"评论:(%@)",model.comment] forState:UIControlStateNormal];
    [self.likeButton setTitle:[NSString stringWithFormat:@"赞:(%d)",model.like.intValue] forState:UIControlStateNormal];
    [self.fwButton setTitle:[NSString stringWithFormat:@"转发:(%d)",model.fw.intValue] forState:UIControlStateNormal];
    [self.commentButton setUserInteractionEnabled:NO];
    [self.likeButton setUserInteractionEnabled:NO];
    [self.fwButton setUserInteractionEnabled:NO];
}
- (IBAction)commentClick:(id)sender {
    
}

- (IBAction)likeClick:(id)sender {
    
}

- (IBAction)fwClick:(id)sender {
    
}
@end

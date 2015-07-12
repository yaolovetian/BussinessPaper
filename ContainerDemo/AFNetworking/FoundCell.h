//
//  FoundCell.h
//  ContainerDemo
//
//  Created by qianfeng on 15-6-17.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Found.h"
@interface FoundCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *fwButton;
@property (weak, nonatomic) IBOutlet UILabel *likeImage;
- (IBAction)commentClick:(id)sender;
- (IBAction)likeClick:(id)sender;
- (IBAction)fwClick:(id)sender;
-(void)showDataWithModel:(Found *)model;
@end

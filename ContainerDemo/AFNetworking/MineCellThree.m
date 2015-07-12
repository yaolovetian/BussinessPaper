//
//  MineCellThree.m
//  BussinessPaper
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 姚帅. All rights reserved.
//

#import "MineCellThree.h"

@implementation MineCellThree

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)payClick:(id)sender {
    if (self.myBlock) {
        self.myBlock();
    }
}
@end

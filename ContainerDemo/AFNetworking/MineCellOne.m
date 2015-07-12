//
//  MineCellOne.m
//  BussinessPaper
//
//  Created by qianfeng on 15-7-3.
//  Copyright (c) 2015年 姚帅. All rights reserved.
//

#import "MineCellOne.h"

@implementation MineCellOne

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)gradeClick:(id)sender {
}

- (IBAction)integrateClick:(id)sender {
}

- (IBAction)collectClick:(id)sender {
    if (self.myBlock) {
        self.myBlock();
    }
    
}

- (IBAction)commentClick:(id)sender {
}
@end

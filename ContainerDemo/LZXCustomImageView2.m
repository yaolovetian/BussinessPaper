//
//  LZXCustomImageView2.m
//  自定义控件
//
//  Created by LZXuan on 14-8-17.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import "LZXCustomImageView2.h"
@interface LZXCustomImageView2()
//弱引用
@property (nonatomic,assign) id target;
@property (nonatomic,assign) SEL action;
@end
@implementation LZXCustomImageView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.target respondsToSelector:self.action]) {
        [self.target performSelector:self.action withObject:self];
    }
}

- (void)addTarget:(id)target action:(SEL)action{
    self.userInteractionEnabled = YES;
    self.target = target;
    self.action = action;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

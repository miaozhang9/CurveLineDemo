//
//  YZTNewsRecommendButton.m
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendButton.h"

@implementation YZTNewsRecommendButton

//+ (instancetype)buttonWithType:(UIButtonType)buttonType {
//    
//    YZTNewsRecommendButton *button = nil;
//    if ((button = [super buttonWithType:UIButtonTypeCustom])) {
//    
//    }
//    return (YZTNewsRecommendButton *)button;
//}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    {
       
    }
    return self;
}

- (void)changeBorderColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius{
    
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:0.5];
    self.layer.cornerRadius = cornerRadius;
    [self.layer setMasksToBounds:YES];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

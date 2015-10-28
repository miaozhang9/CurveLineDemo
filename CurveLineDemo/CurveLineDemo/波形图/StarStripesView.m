//
//  StarStripesView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "StarStripesView.h"

@implementation StarStripesView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createLab];
        [self createStars];
    }
    return self;
}
-(void)createLab{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width -150)/2, 20, 150, 30)];
    lab.textColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont boldSystemFontOfSize:14.0f];
    lab.text = @"保险覆盖(部分覆盖)";
    [self addSubview:lab];

}
-(void)createStars{
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *tmpImgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width -5*20-4*15)/2+i*(20+15), 55, 20, 20)];
        tmpImgView.backgroundColor = [UIColor redColor];
        [self addSubview:tmpImgView];
    }


}
@end

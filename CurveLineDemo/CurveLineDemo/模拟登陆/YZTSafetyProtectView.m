//
//  YZTSafetyProtectView.m
//  CurveLineDemo
//
//  Created by apple on 15/9/6.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "YZTSafetyProtectView.h"

@implementation YZTSafetyProtectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        [self createImageView];
    }
    return self;
}
//209  224   104.5  112
- (void)createImageView{
    CGRect rect = self.frame;
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:
                                 CGRectMake((rect.size.width - 104.5)/2, 60.0f, 104.5, 112)];
    topImageView.backgroundColor = [UIColor redColor];
    [self addSubview:topImageView];

    UILabel *biglabel = [[UILabel alloc] initWithFrame:
                         CGRectMake((rect.size.width - 150.0)/2,
                                    topImageView.frame.origin.y + topImageView.frame.size.height + 30.0f,
                                    150.0f, 30.0f)];
     biglabel.font               = [UIFont systemFontOfSize:20.0f];
    biglabel.backgroundColor    = [UIColor clearColor];
    biglabel.textColor          = [UIColor blackColor];
    biglabel.text               = @"全方位安全保护";
    [self addSubview:biglabel];
    
    
    for (NSInteger i = 0; i< 3 ; i++) {
        UIImageView *tmpimgView = [[UIImageView alloc] initWithFrame:
                                   CGRectMake(93.0f, biglabel.frame.origin.y + biglabel.frame.size.height +30 +i*(27+15), 27.0f, 27.0f)];
        tmpimgView.backgroundColor = [UIColor redColor];
        [self addSubview:tmpimgView];
        
        UILabel *tmpLab = [[UILabel alloc] initWithFrame:CGRectMake(tmpimgView.frame.origin.x+tmpimgView.frame.size.width +10 , tmpimgView.frame.origin.y +5, 170, 20)];
        tmpLab.font               = [UIFont systemFontOfSize:14.0f];
        tmpLab.backgroundColor    = [UIColor clearColor];
        tmpLab.textColor          = [UIColor blackColor];
        tmpLab.text               = @"通过CFCA国家权威检测";
        [self addSubview:tmpLab];
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

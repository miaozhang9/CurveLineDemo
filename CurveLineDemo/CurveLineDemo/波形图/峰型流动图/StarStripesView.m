//
//  StarStripesView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "StarStripesView.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue &0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00)>> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation StarStripesView
{
    NSMutableArray *imgArray;
    UILabel *_lab;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        if (!imgArray) {
            imgArray = [[NSMutableArray alloc] initWithCapacity:5];
        }
        [self createLab];
        
    }
    return self;
}
-(void)createLab{
    UILabel *lab      = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width -160)/2, 5, 160, 30)];
    lab.textColor     = UIColorFromRGB(0xffc8a3);

    lab.textAlignment = NSTextAlignmentCenter;
    lab.font          = [UIFont boldSystemFontOfSize:14.0f];
    lab.text          = @"保险覆盖等级";
    [self addSubview:lab];

    [self createStarsY:lab.frame.origin.y+lab.frame.size.height];
    
    _lab = lab;
}
-(void)createStarsY:(CGFloat)y{
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *tmpImgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width -5*20-4*10)/2+i*(20+10), y, 20, 20)];
        tmpImgView.image        = [UIImage imageNamed:@"policyscan_hollowstar"];
        [self addSubview:tmpImgView];
        [imgArray addObject:tmpImgView];
    }

}
-(void)setPolicylevel:(NSString *)policylevel{
    _policylevel = policylevel;
    NSArray *levelDscArr = @[@"无保障",@"弱保障",@"部分保障",@"部分保障",@"较多保障",@"全保障"];
    if (_policylevel) {
        for (NSInteger i = 0; i<_policylevel.integerValue; i++) {
            UIImageView *imgView = (UIImageView *)imgArray[i];
            imgView.image        = [UIImage imageNamed:@"policyscan_fillstar"];
        }
    }
    _lab.text = [NSString stringWithFormat:@"保险覆盖(%@)",[levelDscArr objectAtIndex:[_policylevel integerValue]]];
}
@end

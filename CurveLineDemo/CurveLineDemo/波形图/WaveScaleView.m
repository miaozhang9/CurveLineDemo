//
//  WaveScaleView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "WaveScaleView.h"
#import "ParabolaView.h"
#import "PolicyScanModel.h"
#define COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define SingleScaleHeight  40
#define TotalScaleHeight 160


@implementation WaveScaleView
{
    CGFloat toatleAverage;//总的平均值//每一刻度最大的保险平均额度
}
- (id)initWithFrame:(CGRect)frame withPolicyScanModel:(PolicyScanModel *)policyScanModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _policyScanModel   = policyScanModel;
        toatleAverage      = _policyScanModel.peakMax.floatValue/3;
        _parabolaViewArray = [NSMutableArray new];
        [self createLabel];
        
    }
    return self;
}

- (void)createLabel {
    
    UIView *leftColorview              = [[UIView alloc] initWithFrame:
                             CGRectMake(self.frame.size.width/2-80, 12.5, 15, 15)];

    /* zhangpoor 20150824 修正ios7.0下原函数颜色无法显示。 */
    leftColorview.backgroundColor      = COLOR(255, 200, 163);

    //[UIColor blueColor];
    //UIColorFromRGB(@"0xffc8a3") ;
    //[UIColor colorWithHexString:@"#ffc8a3"];


    leftColorview.layer.cornerRadius   = 2.0f;
    leftColorview.layer.masksToBounds  = YES;
    [self addSubview:leftColorview];

    UILabel *leftlab                   = [[UILabel alloc] initWithFrame:
                        CGRectMake(self.frame.size.width/2-60, 10, 60, 20)];
    leftlab.backgroundColor            = [UIColor clearColor];
    leftlab.textAlignment              = NSTextAlignmentCenter;
    leftlab.font                       = [UIFont boldSystemFontOfSize:14.0f];
    leftlab.textColor                  = [UIColor whiteColor];
    leftlab.text                       = @"当前覆盖";
    [self addSubview:leftlab];

    UIView *rightColorview             = [[UIView alloc] initWithFrame:
                              CGRectMake(self.frame.size.width/2+10, 12.5, 15, 15)];
    rightColorview.backgroundColor     = [UIColor whiteColor];
    rightColorview.layer.cornerRadius  = 2.0f;
    rightColorview.layer.masksToBounds = YES;
    [self addSubview:rightColorview];

    UILabel *rightlab                  = [[UILabel alloc] initWithFrame:
                         CGRectMake(self.frame.size.width/2+30, 10, 60, 20)];
    rightlab.backgroundColor           = [UIColor clearColor];
    rightlab.textAlignment             = NSTextAlignmentCenter;
    rightlab.font                      = [UIFont boldSystemFontOfSize:14.0f];
    rightlab.textColor                 = [UIColor whiteColor];
    rightlab.text                      = @"建议覆盖";
    [self addSubview:rightlab];

    [self createScalelineY:leftlab.frame.origin.y+leftlab.frame.size.height+20];
}

- (void)createScalelineY:(CGFloat)y {
  
    for (NSInteger i = 0; i < 5 ; i++) {
        UILabel *tmplab          = [[UILabel alloc] initWithFrame:CGRectMake(5, y+40*i, 35+10, 20)];
        tmplab.backgroundColor   = [UIColor clearColor];
        tmplab.textAlignment     = NSTextAlignmentCenter;
        tmplab.font              = [UIFont boldSystemFontOfSize:12.0f];
        tmplab.textColor         = [UIColor whiteColor];
        tmplab.text              = [NSString stringWithFormat:@"%0.0f万",(4-i)*toatleAverage];
        [self addSubview:tmplab];

        UIView *lineView         = [[UIView alloc] init];
        if (i != 4) {
        lineView.frame           = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+5, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - (tmplab.frame.origin.x+tmplab.frame.size.width+5)-20, 0.5);
        }else{
        lineView.frame           = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+5, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - (tmplab.frame.origin.x+tmplab.frame.size.width+5)-20, 1.0f);
        }
        lineView.backgroundColor = [UIColor whiteColor];
        lineView.alpha           = 0.5;

        [self addSubview:lineView];
    }
    
    [self createParabolaViewY:60 withX:70];
}
- (void)createParabolaViewY:(CGFloat)y withX:(CGFloat)x {
    //
    CGFloat num11       = _policyScanModel.accidentInsuranceModel.totalAmount.floatValue/toatleAverage;
    CGFloat num22       = _policyScanModel.healthInsuranceModel.totalAmount.floatValue/toatleAverage;
    CGFloat num33       = _policyScanModel.lifeInsuranceModel.totalAmount.floatValue/toatleAverage;
    //建议覆盖比例数
    CGFloat num1        = _policyScanModel.accidentInsuranceModel.adviceCoveringAmount.floatValue/toatleAverage;
    CGFloat num2        = _policyScanModel.healthInsuranceModel.adviceCoveringAmount.floatValue/toatleAverage;
    CGFloat num3        = _policyScanModel.lifeInsuranceModel.adviceCoveringAmount.floatValue/toatleAverage;

    NSArray *titleArray = @[@"意外险",@"健康险",@"寿险"];
    for (NSInteger i = 0; i<3; i++) {
        ParabolaView *view = [[ParabolaView alloc] init];
        
        switch (i) {
            case 0:
                view.currentCoverageHeight = [NSString stringWithFormat:@"%f",num11*SingleScaleHeight];
                view.frame                 = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+TotalScaleHeight-SingleScaleHeight*num1, 60, SingleScaleHeight*num1);

                break;
            case 1:
                view.currentCoverageHeight = [NSString stringWithFormat:@"%f",num22*SingleScaleHeight];
                view.frame                 = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+TotalScaleHeight-SingleScaleHeight*num2, 60, SingleScaleHeight*num2);
                break;
            case 2:
                view.currentCoverageHeight = [NSString stringWithFormat:@"%f",num33*SingleScaleHeight];
                view.frame                 = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+TotalScaleHeight-SingleScaleHeight*num3, 60, SingleScaleHeight*num3);
                break;

            default:
                break;
        }

        [self addSubview:view];
        [_parabolaViewArray addObject:view];

        UILabel *tmpLab      = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y+view.frame.size.height+10, view.frame.size.width, 20)];
        tmpLab.textColor     = [UIColor whiteColor];
        tmpLab.font          = [UIFont boldSystemFontOfSize:14.0f];
        tmpLab.textAlignment = NSTextAlignmentCenter;
        tmpLab.text          = titleArray[i];
        [self addSubview:tmpLab];

    }
}
/***
 //        switch (i) {
 //            case 0:
 //                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",3*40];
 //                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y, 60, 160*num1);
 //
 //
 //                break;
 //
 //            case 1:
 //                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",2*40];
 //                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+40, 60, 120);
 //                break;
 //            case 2:
 //                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",40];
 //                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+80, 60, 80);
 //                break;
 //
 //            default:
 //                break;
 //        }
 ****/
@end

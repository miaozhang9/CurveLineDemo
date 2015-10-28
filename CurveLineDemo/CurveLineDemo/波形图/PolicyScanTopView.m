//
//  PolicyScanTopView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "PolicyScanTopView.h"
#import "ParabolaView.h"
#import "WaveScaleView.h"
#import "StarStripesView.h"
#import "PolicyScanModel.h"
#define MAXThree(a,b,c) (a>b?(a>c?a:c):(b>c?b:c))

@implementation PolicyScanTopView
{
    NSInteger maximum;

    
}
- (id)initWithFrame:(CGRect)frame withPolicyScanModel:(PolicyScanModel *)policyScanModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _policyScanModel = policyScanModel;
        if (_policyScanModel) {
             [self createShowView];
        }
       

    }
    return self;
}

- (void)createShowView {
    WaveScaleView *view = [[WaveScaleView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 250) withPolicyScanModel:_policyScanModel];
    view.backgroundColor = [UIColor clearColor];
    _waveScaleView= view;
    [self addSubview:view];
    StarStripesView *starView = [[StarStripesView alloc] initWithFrame:CGRectMake(0, view.frame.origin.y+view.frame.size.height, self.frame.size.width, self.frame.size.height - view.frame.size.height)];
    starView.backgroundColor = [UIColor clearColor];
//    starView.policylevel = _policyScanModel.policylevel;
    starView.policylevel = _policyScanModel.insuranceLevel;
    [self addSubview:starView];
}
/*******
 //        [self createParabolaViewY:60   withX:70];
 - (void)createLabel {
 
 UIView *leftColorview = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-80, 15, 15, 15)];
 leftColorview.backgroundColor = [UIColor blackColor];
 [self addSubview:leftColorview];
 
 UILabel *leftlab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-60, 10, 60, 20)];
 leftlab.backgroundColor = [UIColor redColor];
 leftlab.textAlignment = NSTextAlignmentCenter;
 leftlab.font = [UIFont boldSystemFontOfSize:12.0f];
 leftlab.textColor = [UIColor whiteColor];
 leftlab.text = @"当前覆盖";
 [self addSubview:leftlab];
 
 UIView *rightColorview = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2+10, 15, 15, 15)];
 rightColorview.backgroundColor = [UIColor whiteColor];
 [self addSubview:rightColorview];
 
 UILabel *rightlab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2+30, 10, 60, 20)];
 rightlab.backgroundColor = [UIColor blueColor];
 rightlab.textAlignment = NSTextAlignmentCenter;
 rightlab.font = [UIFont boldSystemFontOfSize:12.0f];
 rightlab.textColor = [UIColor whiteColor];
 rightlab.text = @"建议覆盖";
 [self addSubview:rightlab];
 
 [self createScalelineY:leftlab.frame.origin.y+leftlab.frame.size.height+20];
 }
 -(void)createParabolaViewY:(CGFloat)y withX:(CGFloat)x{
 
 //每一刻度最大的保险平均额度
 CGFloat toatleAverage = _policyScanModel.peakMax.floatValue/4;
 //
 NSInteger num1 = _policyScanModel.accidentInsuranceModel.totalAmount.floatValue/toatleAverage;
 NSInteger num2 = _policyScanModel.healthInsuranceModel.totalAmount.floatValue/toatleAverage;
 NSInteger num3 = _policyScanModel.lifeInsuranceModel.totalAmount.floatValue/toatleAverage;
 
 for (NSInteger i = 0; i<3; i++) {
 ParabolaView *view = [[ParabolaView alloc] init];
 switch (i) {
 case 0:
 
 view.currentCoverageHeight = [NSString stringWithFormat:@"%d",160];
 view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+160-160*num1, 60, 160*num1);
 //                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y, 60, 160);
 break;
 
 case 1:
 view.currentCoverageHeight = [NSString stringWithFormat:@"%d",160];
 view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+160-160*num2, 60, 160*num2);
 //                 view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+40, 60, 120);
 break;
 case 2:
 view.currentCoverageHeight = [NSString stringWithFormat:@"%d",160];
 view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+160-160*num3, 60, 160*num3);
 //                 view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+80, 60, 80);
 break;
 
 default:
 break;
 }
 
 [waveScaleView addSubview:view];//self.frame.size.height - 200
 
 }
 }
 - (void)createScalelineY:(CGFloat)y {
 
 for (NSInteger i = 0; i < 5 ; i++) {
 UILabel *tmplab = [[UILabel alloc] initWithFrame:CGRectMake(15, y+39*i, 30, 20)];
 tmplab.backgroundColor = [UIColor clearColor];
 tmplab.textAlignment = NSTextAlignmentCenter;
 tmplab.font = [UIFont boldSystemFontOfSize:12.0f];
 tmplab.textColor = [UIColor whiteColor];
 tmplab.text = [NSString stringWithFormat:@"%ld0万",4-i];
 [self addSubview:tmplab];
 
 UIView *lineView = [[UIView alloc] init];
 if (i != 4) {
 lineView.frame = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+10, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - 100, 0.5);
 }else{
 lineView.frame = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+10, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - 100, 1.0f);
 
 }
 lineView.backgroundColor = [UIColor whiteColor];
 lineView.alpha = 0.5;
 
 [self addSubview:lineView];
 
 //            [self createParabolaViewY:lineView.frame.origin.y-2.5 withX:lineView.frame.origin.x+lineView.frame.size.width];
 
 
 }
 
 
 
 }
*********/
@end

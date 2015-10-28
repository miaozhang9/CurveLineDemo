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
@end

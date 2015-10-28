//
//  PolicyScanTopView.h
//  CurveLineDemo
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PolicyScanModel;
@class WaveScaleView;
@interface PolicyScanTopView : UIView
@property (nonatomic,strong) PolicyScanModel *policyScanModel;
@property (nonatomic,strong) WaveScaleView   *waveScaleView;
- (id)initWithFrame:(CGRect)frame withPolicyScanModel:(PolicyScanModel *)policyScanModel;
@end

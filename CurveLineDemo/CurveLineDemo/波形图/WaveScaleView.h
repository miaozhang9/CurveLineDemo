//
//  WaveScaleView.h
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PolicyScanModel;
@interface WaveScaleView : UIView
@property (nonatomic,strong) PolicyScanModel *policyScanModel;
@property (nonatomic,strong) NSMutableArray  *parabolaViewArray;

- (id)initWithFrame:(CGRect)frame withPolicyScanModel:(PolicyScanModel *)policyScanModel;
@end

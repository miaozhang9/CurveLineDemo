//
//  ViewController.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "ViewController.h"
#import "ParabolaView.h"
#import "PolicyScanTopView.h"
#import "PolicyScanModel.h"
#define MAXThree(a,b,c) (a>b?(a>c?a:c):(b>c?b:c))
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PolicyScanTopView *topView = [[PolicyScanTopView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width,  self.view.frame.size.height) withPolicyScanModel:[self getPolicyScanModel]];
    topView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:topView];

    
}

- (PolicyScanModel *)getPolicyScanModel {
   
   PolicyScanModel * _policyScanModel = [[PolicyScanModel alloc] init];
    
    InsuranceModel *accidentInsuranceModel = [InsuranceModel new];
    accidentInsuranceModel.totalAmount = @"20";
    accidentInsuranceModel.adviceCoveringAmount = @"30";
    _policyScanModel.accidentInsuranceModel = accidentInsuranceModel;
    
    InsuranceModel *healthInsuranceModel = [InsuranceModel new];
    healthInsuranceModel.totalAmount = @"11";
    healthInsuranceModel.adviceCoveringAmount = @"20";
    _policyScanModel.healthInsuranceModel = healthInsuranceModel;
    
    InsuranceModel *lifeInsuranceModel = [InsuranceModel new];
    lifeInsuranceModel.totalAmount = @"14";
    lifeInsuranceModel.adviceCoveringAmount = @"25";
    _policyScanModel.lifeInsuranceModel = lifeInsuranceModel;
    CGFloat maxNumber = MAXThree( _policyScanModel.lifeInsuranceModel.totalAmount.floatValue, _policyScanModel.healthInsuranceModel.totalAmount.floatValue, _policyScanModel.accidentInsuranceModel.totalAmount.floatValue);
    _policyScanModel.peakMax = [NSString stringWithFormat:@"%f",maxNumber]; ;
    //    [NSString stringWithFormat:@"%f",(maxNumber/4)*5];
    return _policyScanModel;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

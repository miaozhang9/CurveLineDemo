//
//  PolicyScanModel.h
//  PANewToapAPP
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InsuranceModel.h"

@interface PolicyScanModel : NSObject
@property(nonatomic,strong)NSString *flag;//判断是否已经问卷调查过 insuranceScan 接口使用
@property(nonatomic,strong)NSString *saveSuccessFlag;//判断保存问卷调查成功 saveQuestionnaire 接口使用

@property(nonatomic,strong)NSString *insureOrder;//投保顺序
@property(nonatomic,strong)NSString *insuranceProposal;//你的状态
//@property(nonatomic,strong)NSString *policylevel;//保险等级
@property(nonatomic,strong)NSString *insuranceLevel;//接口获取的保险等级
@property(nonatomic,strong)NSString *peakMax;//最大数值

@property(nonatomic,strong)InsuranceModel *accidentInsuranceModel;//意外险
@property(nonatomic,strong)InsuranceModel *healthInsuranceModel;//健康险
@property(nonatomic,strong)InsuranceModel *lifeInsuranceModel;//寿险险

+ (PolicyScanModel *)sharedPolicyScanModel;
@end


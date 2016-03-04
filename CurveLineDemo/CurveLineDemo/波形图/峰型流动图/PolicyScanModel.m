//
//  PolicyScanModel.m
//  PANewToapAPP
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 Gavin. All rights reserved.
//

#import "PolicyScanModel.h"

@implementation PolicyScanModel

+ (PolicyScanModel *)sharedPolicyScanModel
{
    static PolicyScanModel *sharedPolicyScanModelInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedPolicyScanModelInstance = [[self alloc] init];
    });
    return sharedPolicyScanModelInstance;
}
@end




//
//  YZTNewsRecommendFinanceDynamicModel.h
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZTNewsRecommendFinanceDynamicModel : NSObject
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, assign) BOOL isShowAll;
@property (nonatomic, strong) NSArray<NSString *> *imageUrls;
@end

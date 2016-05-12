//
//  YZTNewsRecommendFinanceCalendarModel.h
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZTNewsRecommendFinanceCalendarModel : NSObject
@property (nonatomic, copy) NSString *flagUrl;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *currentValue;
@property (nonatomic, copy) NSString *previousValue;
@property (nonatomic, copy) NSString *forecastValue;
@end

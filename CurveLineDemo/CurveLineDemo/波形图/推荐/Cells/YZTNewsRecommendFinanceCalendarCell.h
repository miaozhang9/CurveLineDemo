//
//  YZTNewsRecommendFinanceCalendarCell2.h
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZTNewsRecommendFinanceCalendarModel.h"
@interface YZTNewsRecommendFinanceCalendarCell : UITableViewCell
- (void)updateWithModel:(id )model;
+ (CGFloat)cellHeight:(YZTNewsRecommendFinanceCalendarModel *)model;
@end

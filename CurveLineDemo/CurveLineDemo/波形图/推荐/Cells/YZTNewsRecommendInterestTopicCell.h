//
//  YZTNewsRecommendInterestTopicCell.h
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZTNewsRecommendInterestTopicBottomView.h"
typedef void (^ClickChangeBlock)(id object);


@interface YZTNewsRecommendInterestTopicCell : UITableViewCell

@property (nonatomic, copy) ClickChangeBlock clickChangeBlock;


@property (nonatomic,strong) YZTNewsRecommendInterestTopicBottomView *topicBottomView;;
@end

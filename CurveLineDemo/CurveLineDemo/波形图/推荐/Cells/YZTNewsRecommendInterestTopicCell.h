//
//  YZTNewsRecommendInterestTopicCell.h
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZTNewsRecommendInterestTopicBottomView.h"


typedef NS_ENUM(NSInteger, TopicClickEventType) {
    LikeClickEvent = 0,//喜欢
    NoLikeClickEvent = 1,//不喜欢
    MoreClickEvent  = 2,//更多
};
typedef void (^TopicButtonClickChangeBlock)(id object ,TopicClickEventType);


@interface YZTNewsRecommendInterestTopicCell : UITableViewCell

@property (nonatomic, copy) TopicButtonClickChangeBlock clickChangeBlock;


@property (nonatomic,strong) YZTNewsRecommendInterestTopicBottomView *topicBottomView;;
@end

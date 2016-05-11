//
//  YZTNewsRecommendInterestTopicBottomView.m
//  CurveLineDemo
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendInterestTopicBottomView.h"
#import "Masonry.h"

@implementation YZTNewsRecommendInterestTopicBottomView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    {
        [self addSubViews];
       
    }
    
    return self;
}

- (void)addSubViews {
    
    for (int i = 0; i < 3; i ++) {

        YZTNewsRecommendInterestTopicOtherView *topicOtherView = [YZTNewsRecommendInterestTopicOtherView new];
        [self addSubview:topicOtherView];
        
        
        [topicOtherView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.equalTo(self.mas_top).offset(0);
            }else {
                make.top.equalTo(@(64*i));
            }
            make.trailing.and.leading.equalTo(self);
            make.height.equalTo(@64);

        }];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

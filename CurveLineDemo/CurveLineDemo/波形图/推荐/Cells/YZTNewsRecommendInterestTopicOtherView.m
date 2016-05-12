//
//  YZTNewsRecommendInterestTopicOtherView.m
//  CurveLineDemo
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendInterestTopicOtherView.h"
#import "Masonry.h"

@interface YZTNewsRecommendInterestTopicOtherView()
@property(nonatomic,strong)UIButton *clickButton;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *tagSourceLabel;
@property(nonatomic,strong)UIView *lineView;

@end
@implementation YZTNewsRecommendInterestTopicOtherView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    {
        [self addSubViews];
        [self defineLayout];
    }
    
    return self;
}

- (void)addSubViews {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    _clickButton = button;
    [self addSubview:button];
    

    UILabel *contentLabel = [UILabel new];
    contentLabel.text = @"习近平开网络大会日媒聚焦中国舆论现状";
    contentLabel.textAlignment = NSTextAlignmentLeft;
    //    contentLabel.numberOfLines = 2;
    contentLabel.font = [UIFont systemFontOfSize:14.f];
    //        contentLabel.backgroundColor = [UIColor redColor];
    _contentLabel = contentLabel;
    [self addSubview:contentLabel];
    
    UILabel *tagSourceLabel = [UILabel new];
    tagSourceLabel.text = @"多维新闻网 20小时前";
    tagSourceLabel.textAlignment = NSTextAlignmentLeft;
    //    tagSourceLabel.numberOfLines = 2;
    tagSourceLabel.font = [UIFont systemFontOfSize:12.f];
    //        tagSourceLabel.backgroundColor = [UIColor redColor];
    _tagSourceLabel = tagSourceLabel;
    [self addSubview:tagSourceLabel];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor grayColor];
    _lineView = lineView;
    [self addSubview:lineView];
    
}

- (void)defineLayout {
    
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
          make.edges.equalTo(self).insets(UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(self);
        make.top.equalTo(self.mas_top).offset(0.0);
        make.height.equalTo(@0.5);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(7.f);
        make.height.equalTo(@20);
        make.leading.equalTo(@15);
    }];
    [self.tagSourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(7.f);
        make.height.equalTo(@20);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

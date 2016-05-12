//
//  YZTNewsRecommendInterestTopicCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendInterestTopicCell.h"
#import "YZTNewsRecommendInterestTopicBottomView.h"
#import "Masonry.h"

@interface YZTNewsRecommendInterestTopicCell()
///标识来源
@property (nonatomic, strong) UILabel *tagLab;
///图片
@property (nonatomic, strong) UIImageView *imgView;
///话题title
@property (nonatomic, strong) UILabel *titleLab;
//
@property (nonatomic, strong) UILabel *descLab;
///喜欢按钮
@property (nonatomic, strong) UIButton *likeButton;
///不喜欢按钮
@property (nonatomic, strong) UIButton *noLikeButton;
///更多按钮
@property (nonatomic, strong) UIButton *moreButton;
///线
@property (nonatomic, strong) UIView *line;

//@property (nonatomic,strong) YZTNewsRecommendInterestTopicBottomView *topicBottomView;

@property (nonatomic, strong) UIView *bottomLineView;
@end
@implementation YZTNewsRecommendInterestTopicCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initSubViewss];
        [self defineLayout];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)initSubViewss {
    
    if (!_imgView) {
        UIImageView *imgView = [UIImageView new];
        imgView.backgroundColor = [UIColor yellowColor];
        _imgView = imgView;
        [self.contentView addSubview:imgView];
    }
   
    [self.contentView addSubview:self.tagLab];
    if (!_tagLab) {
        UILabel *tagLab = [UILabel new];
        tagLab.text = @"多维新闻网 20小时前";
        tagLab.textAlignment = NSTextAlignmentLeft;
        tagLab.font = [UIFont systemFontOfSize:12.f];
        //    tagLab.backgroundColor = [UIColor redColor];
        _tagLab = tagLab;
        [self.contentView addSubview:tagLab];
    }
   
    if (!_titleLab) {
        UILabel *titleLab = [UILabel new];
        titleLab.text = @"习近平开网络大会日媒聚焦中国舆论现状,习近平开网络大会日媒聚焦中国舆论现状";
        titleLab.textAlignment = NSTextAlignmentLeft;
        titleLab.numberOfLines = 2;
        titleLab.font = [UIFont systemFontOfSize:14.f];
        //        titleLab.backgroundColor = [UIColor redColor];
        _titleLab = titleLab;
        [self.contentView addSubview:titleLab];
    }
    
    if (!_descLab) {
        UILabel *descLab = [UILabel new];
        descLab.text = @"您对习近平感兴趣吗";
        descLab.textAlignment = NSTextAlignmentLeft;
        descLab.numberOfLines = 2;
        descLab.font = [UIFont systemFontOfSize:12.f];
        //    descLab.backgroundColor = [UIColor redColor];
        _descLab = descLab;
        [self.contentView addSubview:descLab];
    }
   
    if (!_likeButton) {
        UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        likeButton.backgroundColor = [UIColor purpleColor];
        _likeButton = likeButton;
        [self.contentView addSubview:likeButton];

    }
    
    if (!_noLikeButton) {
        UIButton *noLikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        noLikeButton.backgroundColor = [UIColor purpleColor];
        _noLikeButton = noLikeButton;
        [self.contentView addSubview:noLikeButton];
    }
  
    if (!_moreButton) {
        UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        moreButton.backgroundColor = [UIColor purpleColor];
        [moreButton addTarget:self action:@selector(moreButtonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
        _moreButton = moreButton;
        [self.contentView addSubview:moreButton];
    }
    
    if (!_line) {
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor blackColor];
        _line = line;
        [self.contentView addSubview:line];
    }
   
    if (!_topicBottomView) {
        YZTNewsRecommendInterestTopicBottomView *topicBottomView = [YZTNewsRecommendInterestTopicBottomView new];
//        topicBottomView.backgroundColor = [UIColor redColor];
        topicBottomView.hidden = YES;
        _topicBottomView = topicBottomView;
        [self.contentView addSubview:topicBottomView];
    }

    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [UIColor grayColor];
    _bottomLineView = bottomLineView;
    [self.contentView addSubview:bottomLineView];
    
}

- (void)defineLayout {

    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(15.f);
        make.top.equalTo(self.contentView.mas_top).offset(15.f);
        make.size.mas_equalTo(CGSizeMake(70.f, 49.f));
    }];
    
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView);
        make.left.equalTo(self.imgView.mas_right).offset(10.f);
        make.height.equalTo(@15);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tagLab);
        make.right.equalTo(self.contentView.mas_right).offset(-15.f);
        make.top.equalTo(self.tagLab.mas_bottom);
        make.height.equalTo(@40);
    }];

    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.imgView);
        make.top.equalTo(self.imgView.mas_bottom).offset(30.f);
        make.size.mas_equalTo(CGSizeMake(150.f, 20.f));
    }];

    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-15.f);
        make.centerY.equalTo(self.descLab);
        make.size.mas_equalTo(CGSizeMake(30.f, 21.f));
    }];

    [self.noLikeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moreButton.mas_left).offset(-10.f);
        make.size.and.centerY.equalTo(self.moreButton);
        
    }];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.noLikeButton.mas_left).offset(-10.f);
        make.size.and.centerY.equalTo(self.noLikeButton);
    }];
    
 
    [self.topicBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.likeButton.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(1000, 64*3));
        make.leading.equalTo(@0);
    }];

    
  
    [self.bottomLineView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.equalTo(@0.5);
    }];

}


- (void)moreButtonClickEvent:(UIButton *)sender {
sender.selected = !sender.selected;
    NSLog(@"%d",sender.selected);

    if (self.clickChangeBlock)
        self.clickChangeBlock(self);

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

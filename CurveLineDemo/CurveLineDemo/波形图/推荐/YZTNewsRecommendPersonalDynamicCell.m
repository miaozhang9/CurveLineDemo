//
//  YZTNewsRecommendPersonalDynamicCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendPersonalDynamicCell.h"
#import "Masonry.h"


@interface YZTNewsRecommendPersonalDynamicCell()
///标识title
@property (nonatomic, strong) UILabel *tagLab;
///图片
@property (nonatomic, strong) UIImageView *imgView;
///描述
@property (nonatomic, strong) UILabel *descLab;
///选项按钮
@property (nonatomic, strong) UIButton *topRightButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@end

@implementation YZTNewsRecommendPersonalDynamicCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        [self initSubViews];
        [self defineLayout];
    }
    return self;
}


- (void)initSubViews {
    UILabel *tagLab = [UILabel new];
    tagLab.text = @"第三方应用标识";
    tagLab.textAlignment = NSTextAlignmentLeft;
    tagLab.font = [UIFont systemFontOfSize:12.f];
    //    tagLab.backgroundColor = [UIColor redColor];
    _tagLab = tagLab;
    [self.contentView addSubview:tagLab];
    
    UIButton *topRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    topRightButton.backgroundColor = [UIColor purpleColor];
    _topRightButton = topRightButton;
    [self.contentView addSubview:topRightButton];
    
    UIImageView *imgView = [UIImageView new];
    imgView.backgroundColor = [UIColor yellowColor];
    _imgView = imgView;
    [self.contentView addSubview:imgView];
    
    UILabel *descLab = [UILabel new];
    descLab.text = @"你爸爸邀请你使用懒人理财参与基金定投计划";
    descLab.numberOfLines = 2;
    descLab.font = [UIFont systemFontOfSize:16.f];
    descLab.textAlignment = NSTextAlignmentLeft;
    //    descLab.backgroundColor = [UIColor blueColor];
    _descLab = descLab;
    [self.contentView addSubview:descLab];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.backgroundColor = [UIColor orangeColor];
    [leftButton setTitle:@"接受" forState:UIControlStateNormal];
    _leftButton = leftButton;
    [self.contentView addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.backgroundColor = [UIColor greenColor];
    [rightButton setTitle:@"拒绝" forState:UIControlStateNormal];
    _rightButton = rightButton;
    [self.contentView addSubview:rightButton];
    
}

- (void)defineLayout {
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        
    }];
    
    [self.topRightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@-10);
        make.top.equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(30.f, 20.f));
    }];

    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@10);
        make.top.equalTo(@34);
        make.size.mas_equalTo(CGSizeMake(70.f, 49.f));
    }];

    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.imgView.mas_trailing).offset(5.f);
        make.top.equalTo(self.imgView.mas_top);
        make.trailing.equalTo(@-10);
        make.bottom.equalTo(self.imgView.mas_bottom);
    }];

    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.descLab.mas_leading);
        make.top.equalTo(self.descLab.mas_bottom).offset(15.f);
        make.size.mas_equalTo(CGSizeMake(90.f, 30.f));
        
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftButton.mas_right).offset(15.f);
        make.size.and.top.equalTo(self.leftButton);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

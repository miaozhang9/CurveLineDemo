//
//  YZTNewsRecommendTodayFortuneCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendTodayFortuneCell.h"
#import "Masonry.h"

@interface YZTNewsRecommendTodayFortuneCell()
///运势title
@property (nonatomic, strong) UILabel *titleLab;
///日期
@property (nonatomic, strong) UILabel *dateLab;
///运势描述
@property (nonatomic, strong) UILabel *descLab;
///图片
@property (nonatomic, strong) UIImageView *imgView;
///更多按钮
@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIButton *button1;

@property (nonatomic, strong) UIButton *button2;

@property (nonatomic, strong) UIButton *button3;
@end

@implementation YZTNewsRecommendTodayFortuneCell

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
    
    UILabel *titleLab = [UILabel new];
    titleLab.text = @"大吉";
    titleLab.textAlignment = NSTextAlignmentLeft;
//    titleLab.numberOfLines = 2;
    titleLab.font = [UIFont systemFontOfSize:24.f];
    //        titleLab.backgroundColor = [UIColor redColor];
    _titleLab = titleLab;
    [self.contentView addSubview:titleLab];
    
    
    UILabel *dateLab = [UILabel new];
    dateLab.text = @"丙申年 三月二十一\n2016年4月28日";
    dateLab.textAlignment = NSTextAlignmentRight;
    dateLab.font = [UIFont systemFontOfSize:12.f];
    dateLab.numberOfLines = 2;
    //    dateLab.backgroundColor = [UIColor redColor];
    _dateLab = dateLab;
    [self.contentView addSubview:dateLab];

    UIImageView *imgView = [UIImageView new];
    imgView.backgroundColor = [UIColor yellowColor];
    _imgView = imgView;
    [self.contentView addSubview:imgView];
    
    
    UILabel *descLab = [UILabel new];
    descLab.text = @"技术分析师,做多黄金,上看至1400美元";
    descLab.numberOfLines = 2;
    descLab.textAlignment = NSTextAlignmentLeft;
    descLab.font = [UIFont systemFontOfSize:14.f];
    _descLab = descLab;
    [self.contentView addSubview:descLab];

    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor purpleColor];
    button1.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [button1 setTitle:@"黄金" forState:UIControlStateNormal];
    _button1 = button1;
    [self.contentView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor purpleColor];
    button2.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [button2 setTitle:@"美元" forState:UIControlStateNormal];
    _button2 = button2;
    [self.contentView addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.backgroundColor = [UIColor purpleColor];
    button3.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [button3 setTitle:@"钢铁" forState:UIControlStateNormal];
    _button3 = button3;
    [self.contentView addSubview:button3];
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.backgroundColor = [UIColor orangeColor];
    moreButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [moreButton setTitle:@"更多" forState:UIControlStateNormal];
    _moreButton = moreButton;
    [self.contentView addSubview:moreButton];

}

- (void)defineLayout {
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(15.f);
        make.top.equalTo(self.contentView.mas_top).offset(15.f);
        make.size.mas_equalTo(CGSizeMake((self.contentView.bounds.size.width-15)/2, 20.f));
    }];
    
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-15.f);
        make.top.equalTo(self.titleLab);
        make.height.equalTo(@30);
        
    }];

    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(30.f);
        make.size.mas_equalTo(CGSizeMake(40.f, 40.f));
    }];

    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(15.f);
        make.right.equalTo(self.contentView.mas_right).offset(-80.f);
        make.centerY.equalTo(self.imgView);
        make.height.equalTo(@40);
    }];

    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.descLab);
        make.top.equalTo(self.descLab.mas_bottom).offset(15.f);
        make.size.mas_equalTo(CGSizeMake(50.f, 20.f));
    }];

    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button1.mas_right).offset(10.f);
        make.size.and.top.equalTo(self.button1);
    }];
    
    [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button2.mas_right).offset(10.f);
        make.size.and.top.equalTo(self.button2);
    }];

    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20.f);
        make.right.equalTo(self.contentView.mas_right).offset(-15.f);
        make.size.mas_equalTo(CGSizeMake(50.f, 30.f));
    }];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

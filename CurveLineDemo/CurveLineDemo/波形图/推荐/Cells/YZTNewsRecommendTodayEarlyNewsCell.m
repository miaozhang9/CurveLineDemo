//
//  YZTNewsRecommendTodayEarlyNewsCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendTodayEarlyNewsCell.h"
#import "Masonry.h"

@interface YZTNewsRecommendTodayEarlyNewsCell ()
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UILabel *descLab;
@property (nonatomic, strong) UIView *bottomLineView;
@end

@implementation YZTNewsRecommendTodayEarlyNewsCell
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
    UILabel *dateLab = [UILabel new];
    dateLab.text = @"2016年05月09日";
    dateLab.textAlignment = NSTextAlignmentRight;
    dateLab.font = [UIFont systemFontOfSize:12.f];
    _dateLab = dateLab;
    [self.contentView addSubview:dateLab];
  
    UILabel *descLab = [UILabel new];
    descLab.text = @"日经225大跌近1000点,带动全球市场盘中闪跌;日元兑美元和欧元均大幅升值,经225大跌近1000点,带动全球市场盘中闪跌;日元兑美元和欧元均大幅升值";
    descLab.numberOfLines = 100;
    descLab.textAlignment = NSTextAlignmentLeft;
    descLab.font = [UIFont systemFontOfSize:14.f];
    _descLab = descLab;
    [self.contentView addSubview:descLab];

    
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [UIColor grayColor];
    _bottomLineView = bottomLineView;
    [self.contentView addSubview:bottomLineView];
   
}

- (void)defineLayout {
    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15.f);
        make.right.equalTo(self.contentView.mas_right).offset(-15.f);
        make.top.equalTo(self.contentView.mas_top).offset(10);

    }];
    
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@-15);
        make.bottom.equalTo(self.bottomLineView.mas_bottom).offset(-10.f);
        make.size.mas_equalTo(CGSizeMake(150.f, 20.f));
    }];
    [self.bottomLineView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.equalTo(@0.5);
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

//
//  YZTNewsRecommendHotSpotAnalysisCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendHotSpotAnalysisCell.h"
#import "Masonry.h"

@interface YZTNewsRecommendHotSpotAnalysisCell()
///标识title
@property (nonatomic, strong) UILabel *titleLab;
///图片
@property (nonatomic, strong) UIImageView *imgView;
///描述
@property (nonatomic, strong) UILabel *descLab;

@property (nonatomic, strong) UIView *bottomLineView;

@end
@implementation YZTNewsRecommendHotSpotAnalysisCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        [self initSubViews];
        [self defineLayout];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)initSubViews {
    
    UIImageView *imgView = [UIImageView new];
    imgView.backgroundColor = [UIColor yellowColor];
    _imgView = imgView;
    [self.contentView addSubview:imgView];
    
    UILabel *titleLab = [UILabel new];
    titleLab.text = @"温州:土地年限免费续期不可能会造成国资流失";
    titleLab.numberOfLines = 2;
    titleLab.textAlignment = NSTextAlignmentLeft;
    titleLab.font = [UIFont systemFontOfSize:14.f];
    _titleLab = titleLab;
    [self.contentView addSubview:titleLab];
    
    UILabel *descLab = [UILabel new];
    descLab.text = @"日经225大跌近1000点,带动全球市场盘中闪跌;日元兑美元和欧元均大幅升值,经225大跌近1000点,带动全球市场盘中闪跌;日元兑美元和欧元均大幅升值";
    descLab.numberOfLines = 2;
    descLab.textAlignment = NSTextAlignmentLeft;
    descLab.font = [UIFont systemFontOfSize:12.f];
    _descLab = descLab;
    [self.contentView addSubview:descLab];
    
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [UIColor grayColor];
    _bottomLineView = bottomLineView;
    [self.contentView addSubview:bottomLineView];
   
}

- (void)defineLayout {
  
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@10);
            make.top.equalTo(@15);
            make.size.mas_equalTo(CGSizeMake(70.f, 49.f));
        }];

        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.imgView.mas_trailing).offset(5.f);
            make.top.equalTo(self.imgView.mas_top);
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-10);
            make.height.equalTo(@40);
        }];
        
    
        [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.titleLab.mas_leading);
            make.top.equalTo(self.titleLab.mas_bottom).offset(0.f);
            make.trailing.equalTo(@-10);
          
        }];
    
    [self.bottomLineView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.equalTo(@0.5);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

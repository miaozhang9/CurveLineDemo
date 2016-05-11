//
//  YZTNewsRecommendNoLoginShowCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendNoLoginShowCell.h"
#import "Masonry.h"
#import "YZTNewsRecommendButton.h"
@interface YZTNewsRecommendNoLoginShowCell()
///内容
@property (nonatomic, strong) UILabel *contentLabel;
///登录
@property (nonatomic, strong) UIButton *loginButton;
///不再提示
@property (nonatomic, strong) UIButton *hintButton;
@end

@implementation YZTNewsRecommendNoLoginShowCell

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
    UILabel *contentLabel = [UILabel new];
    contentLabel.text = @"想获得更加智能的投资决策辅助建议吗?请登录APP体验更佳便捷个性化数据服务吧";
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.numberOfLines = 2;
    contentLabel.font = [UIFont systemFontOfSize:16.f];
    //        contentLabel.backgroundColor = [UIColor redColor];
    _contentLabel = contentLabel;
    [self.contentView addSubview:contentLabel];
    
    YZTNewsRecommendButton *loginButton = [YZTNewsRecommendButton buttonWithType:UIButtonTypeCustom];
     [loginButton changeBorderColor:[UIColor grayColor] cornerRadius:3.f];
    loginButton.backgroundColor = [UIColor purpleColor];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton = loginButton;
    [self.contentView addSubview:loginButton];
    
    YZTNewsRecommendButton *hintButton = [YZTNewsRecommendButton buttonWithType:UIButtonTypeCustom];
    [hintButton changeBorderColor:[UIColor grayColor] cornerRadius:3.f];
    hintButton.backgroundColor = [UIColor purpleColor];
    hintButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [hintButton setTitle:@"不再提醒" forState:UIControlStateNormal];
    _hintButton = hintButton;
    [self.contentView addSubview:hintButton];
}

- (void)defineLayout {
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(self.contentView.mas_top).offset(35.f);
        make.height.equalTo(@40);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(100.f);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(20.f);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    [self.hintButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-100.f);
        make.size.and.top.equalTo(self.loginButton);
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

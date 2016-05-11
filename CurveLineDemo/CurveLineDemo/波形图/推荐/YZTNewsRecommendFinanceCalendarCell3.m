//
//  YZTNewsRecommendFinanceCalendarCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendFinanceCalendarCell3.h"
#import "Masonry.h"

@interface YZTNewsRecommendFinanceCalendarCell3()
///日期
@property (nonatomic, strong) UILabel *dateLab;
///标识图片
@property (nonatomic, strong) UIImageView *imgView;
///今值
@property (nonatomic, strong) UILabel *currentValueLabel;
///前值
@property (nonatomic, strong) UILabel *previousValueLabel;
///预测
@property (nonatomic, strong) UILabel *forecastValueLabel;
///时间状态
@property (nonatomic, strong) UILabel *rightStatusLabel;
///描述
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation YZTNewsRecommendFinanceCalendarCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        [self initSubViews];
        [self defineLayout];
    }
    return self;
}

- (void)initSubViews{
    UILabel *dateLab = [UILabel new];
    dateLab.text = @"2016年5月4日";
    dateLab.textAlignment = NSTextAlignmentLeft;
    dateLab.font = [UIFont systemFontOfSize:12.f];
    //        dateLab.backgroundColor = [UIColor redColor];
    _dateLab = dateLab;
    [self.contentView addSubview:dateLab];
    
    UIImageView *imgView = [UIImageView new];
    imgView.backgroundColor = [UIColor yellowColor];
    _imgView = imgView;
    [self.contentView addSubview:imgView];
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.text = @"4月27日当周FOMC利率决策(中国)";
    contentLabel.textAlignment = NSTextAlignmentLeft;
    //    contentLabel.numberOfLines = 2;
    contentLabel.font = [UIFont systemFontOfSize:14.f];
    //        contentLabel.backgroundColor = [UIColor redColor];
    _contentLabel = contentLabel;
    [self.contentView addSubview:contentLabel];
    
    UILabel *currentValueLabel = [UILabel new];
    currentValueLabel.text = @"今值51.8";
    currentValueLabel.textAlignment = NSTextAlignmentLeft;
    //    currentValueLabel.numberOfLines = 2;
    currentValueLabel.font = [UIFont systemFontOfSize:12.f];
    //        contentLabel.backgroundColor = [UIColor redColor];
    _currentValueLabel = currentValueLabel;
    [self.contentView addSubview:currentValueLabel];
    
    UILabel *previousValueLabel = [UILabel new];
    previousValueLabel.text = @"前值0.6%";
    previousValueLabel.textAlignment = NSTextAlignmentLeft;
    //    previousValueLabel.numberOfLines = 2;
    previousValueLabel.font = [UIFont systemFontOfSize:12.f];
    //        previousValueLabel.backgroundColor = [UIColor redColor];
    _previousValueLabel = previousValueLabel;
    [self.contentView addSubview:previousValueLabel];
    
    UILabel *forecastValueLabel = [UILabel new];
    forecastValueLabel.text = @"预测0.3%";
    forecastValueLabel.textAlignment = NSTextAlignmentLeft;
    //    forecastValueLabel.numberOfLines = 2;
    forecastValueLabel.font = [UIFont systemFontOfSize:12.f];
    _forecastValueLabel = forecastValueLabel;
    [self.contentView addSubview:forecastValueLabel];
    
    UILabel *rightStatusLabel = [UILabel new];
    rightStatusLabel.text = @"09:00\n已发布";
    rightStatusLabel.textAlignment = NSTextAlignmentCenter;
    rightStatusLabel.numberOfLines = 2;
    rightStatusLabel.font = [UIFont systemFontOfSize:12.f];
            rightStatusLabel.backgroundColor = [UIColor redColor];
    _rightStatusLabel = rightStatusLabel;
    [self.contentView addSubview:rightStatusLabel];
    
}

- (void)defineLayout {
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.leading.equalTo(@15);
        make.height.equalTo(@15);
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLab.mas_bottom).offset(5.f);
        make.leading.equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(25.f, 16.f));
    }];

    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(15.f);
        make.right.equalTo(self.contentView.mas_right).offset(-80.f);
        make.top.equalTo(self.imgView);
        make.height.equalTo(@20);
    }];

    [self.rightStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel);
        make.left.equalTo(self.contentLabel.mas_right).offset(10.f);
        make.right.equalTo(self.contentView.mas_right).offset(-15.f);
    }];

    [self.currentValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(5.f);
        make.size.mas_equalTo(CGSizeMake(60.f, 20.f));
    }];

    [self.previousValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentValueLabel.mas_right).offset(5.f);
        make.size.and.top.equalTo(self.currentValueLabel);
        
    }];

    [self.forecastValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.previousValueLabel.mas_right).offset(5.f);
        make.size.and.top.equalTo(self.previousValueLabel);
        
    }];
    
}
#pragma mark - getter & setter

- (UILabel *(^)(UIFont *font))createLabel
{
    return ^UILabel *(UIFont *font) {
        UILabel *l = [[UILabel alloc] init];
        l.font = font;
        l.textAlignment = NSTextAlignmentLeft;
        return l;
    };
}

//- (UIView *(^)())createView
//{
//    return ^UIView *() {
//        UIView *v = [UIView new];
//        v.backgroundColor = [UIColor blueColor];
//        return v;
//    };
//}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

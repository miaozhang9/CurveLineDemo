//
//  YZTNewsRecommendFinanceCalendarCell2.m
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTRecommendFinanceCalendarCell.h"
#import "Masonry.h"

static CGFloat const kBottomValueLabelWidth = 80.f;

@interface YZTRecommendFinanceCalendarCell()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *flagImageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *rightStatusLabel;
@property (nonatomic, strong) UILabel *currentValueLabel;
@property (nonatomic, strong) UILabel *previousValueLabel;
@property (nonatomic, strong) UILabel *forecastValueLabel;
@end

@implementation YZTRecommendFinanceCalendarCell
static inline NSAttributedString *attributeSting(NSString *text)
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:13.f]};
    NSMutableAttributedString *a = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 2.f;
    [a addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, a.length)];
    [a addAttributes:attribute range:NSMakeRange(0, a.length)];
    return a;
};
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self yzt_setupSubviews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}


- (void)updateWithModel:(id )model
{
    YZTNewsRecommendFinanceCalendarModel *tmpmodel = model;
    self.flagImageView.backgroundColor = [UIColor redColor];
    self.contentLabel.attributedText = attributeSting(tmpmodel.content);
    self.rightStatusLabel.text = tmpmodel.time;
    if (tmpmodel.time) {
        self.rightStatusLabel.backgroundColor = [UIColor blueColor];
        self.rightStatusLabel.textColor = [UIColor whiteColor];
    }
    self.currentValueLabel.text = [NSString stringWithFormat:@"今值 %@",tmpmodel.currentValue];
    self.previousValueLabel.text = [NSString stringWithFormat:@"前值 %@",tmpmodel.previousValue];
    self.forecastValueLabel.text = [NSString stringWithFormat:@"预测 %@",tmpmodel.forecastValue];
}
+ (CGFloat)cellHeight:(YZTNewsRecommendFinanceCalendarModel *)model
{
    CGFloat height = 0.f;
    height += 10.f;
    height += 5.f;
    height += [self contentHeight:attributeSting(model.content)];
    height += 5.f;
    if (model.currentValue.length > 0 || model.previousValue.length > 0 || model.forecastValue.length > 0) {
        height += 11.f;
    }
    height += 5.f;
    return height;
}


+ (CGFloat)contentHeight:(NSAttributedString *)text
{
    return [text boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 15.f * 3 - 5.f * 2 - 50.f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height + 1.f;
}

#pragma mark - private

- (void)yzt_setupSubviews
{
    [self.contentView addSubview:self.containerView];
    [self.containerView addSubview:self.flagImageView];
    [self.containerView addSubview:self.contentLabel];
    [self.containerView addSubview:self.rightStatusLabel];
    [self.containerView addSubview:self.currentValueLabel];
    [self.containerView addSubview:self.previousValueLabel];
    [self.containerView addSubview:self.forecastValueLabel];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10.f,10.f, 0, 10.f));
    }];
    
    [self.flagImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@5);
        make.top.equalTo(@5);
        make.size.mas_equalTo(CGSizeMake(15.f, 10.f));
    }];
    
    [self.rightStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@-5);
        make.top.equalTo(self.flagImageView.mas_top).offset(10.f);
        make.width.equalTo(@50);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.flagImageView.mas_trailing).offset(5.f);
        make.top.equalTo(self.flagImageView.mas_top);
        make.trailing.equalTo(self.rightStatusLabel.mas_leading).offset(-5.f);
    }];
    
   
    [self.currentValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@20);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(5.f);
        make.width.equalTo(@(kBottomValueLabelWidth));
    }];
    
    [self.previousValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.currentValueLabel.mas_trailing).offset(5.f);
        make.top.equalTo(self.currentValueLabel.mas_top);
        make.width.equalTo(@(kBottomValueLabelWidth));
    }];
    
    [self.forecastValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.previousValueLabel.mas_trailing).offset(5.f);
        make.top.equalTo(self.currentValueLabel.mas_top);
        make.width.equalTo(@(kBottomValueLabelWidth));
    }];

}

#pragma mark - getter & setter

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.clipsToBounds = YES;
        _containerView.layer.cornerRadius = 3.f;
    }
    return _containerView;
}

- (UILabel *)rightStatusLabel
{
    if (!_rightStatusLabel) {
        _rightStatusLabel = [[UILabel alloc] init];
        _rightStatusLabel.textAlignment = NSTextAlignmentCenter;
        _rightStatusLabel.font = [UIFont systemFontOfSize:12.f];
        _rightStatusLabel.numberOfLines = 0;
    }
    return _rightStatusLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.font = [UIFont systemFontOfSize:13.f];
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UIImageView *)flagImageView
{
    if (!_flagImageView) {
        _flagImageView = [[UIImageView alloc] init];
    }
    return _flagImageView;
}

#pragma mark - getter & setter

- (UILabel *(^)())createLabel
{
    return ^UILabel *(){
        UILabel *l = [UILabel new];
        l.textAlignment = NSTextAlignmentLeft;
        l.font = [UIFont systemFontOfSize:11.f];
        return l;
    };
}

- (UILabel *)currentValueLabel
{
    if (!_currentValueLabel) {
        _currentValueLabel = self.createLabel();
    }
    return _currentValueLabel;
}

- (UILabel *)previousValueLabel
{
    if (!_previousValueLabel) {
        _previousValueLabel = self.createLabel();
    }
    return _previousValueLabel;
}

- (UILabel *)forecastValueLabel
{
    if (!_forecastValueLabel) {
        _forecastValueLabel = self.createLabel();
    }
    return _forecastValueLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

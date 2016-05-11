//
//  YZTNewsRecommendFinanceDynamicCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendFinanceDynamicCell.h"
#import "Masonry.h"

static CGFloat const kViewLeftAndRightMargin = 10.f;//距离左右边距
static CGFloat const kTimeLabelWidth = 40.f;//时间标签宽度
static CGFloat const kContentLabelMaxHeight = 100.f;//当超过5行时文字默认最大高度
static CGFloat const kImageDefaultHeight = 64.f;//图片默认高度
static CGFloat const kImageViewMargin = 5.f;//图片间隔

@interface YZTNewsRecommendFinanceDynamicCell ()
@property (nonatomic, strong) UIView *line01;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *expandBtn;
@property (nonatomic, strong) UIView *line02;
@property (nonatomic, strong) UIView *point;
@end


@implementation YZTNewsRecommendFinanceDynamicCell


static inline NSAttributedString *attributeSting(NSString *text)
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14.f]};
    NSMutableAttributedString *a = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 3.f;
    [a addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, a.length)];
    [a addAttributes:attribute range:NSMakeRange(0, a.length)];
    return a;
};
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        [self setupSubviews];
//        [self defineLayout];
    }
    return self;
}


- (void)setupSubviews
{
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.line01];
    [self.contentView addSubview:self.line02];
    [self.contentView addSubview:self.point];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.expandBtn];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@(kViewLeftAndRightMargin));
        make.top.equalTo(@10);
        make.width.equalTo(@(kTimeLabelWidth));
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.timeLabel.mas_leading);
        make.top.equalTo(self.timeLabel.mas_bottom);
    }];
    
    [self.line01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.timeLabel.mas_trailing).offset(5.f);
        make.top.equalTo(@0);
        make.bottom.equalTo(self.point.mas_top);
        make.width.equalTo(@1);
    }];
    
    [self.point mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.line01.mas_centerX);
        make.centerY.equalTo(self.timeLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(5.f, 5.f));
    }];
    
    [self.line02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.point.mas_bottom);
        make.centerX.equalTo(self.point.mas_centerX);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(self.line01.mas_width);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.line01.mas_trailing).offset(10.f);
        make.trailing.equalTo(@(-kViewLeftAndRightMargin));
        make.top.equalTo(@10);
    }];
    
    [self.expandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentLabel.mas_leading);
        make.top.equalTo(self.contentLabel.mas_bottom);
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

- (UIView *(^)())createView
{
    return ^UIView *() {
        UIView *v = [UIView new];
        v.backgroundColor = [UIColor blueColor];
        return v;
    };
}

- (UIButton *)expandBtn
{
    if (!_expandBtn) {
        _expandBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _expandBtn.titleLabel.font = YZTFont(14.f);
        [_expandBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_expandBtn addTarget:self action:@selector(expandBtnActionEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _expandBtn;
}

- (UIView *)line01
{
    if (!_line01) {
        _line01 = self.createView();
    }
    return _line01;
}

- (UIView *)line02
{
    if (!_line02) {
        _line02 = self.createView();
    }
    return _line02;
}

- (UIView *)point
{
    if (!_point) {
        _point = self.createView();
        _point.layer.cornerRadius = 5.f / 2;
        _point.clipsToBounds = YES;
    }
    return _point;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = self.createLabel([UIFont systemFontOfSize:14.f]);
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"日本央行";
        _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _contentLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = self.createLabel([UIFont systemFontOfSize:14.f]);

    }
    return _timeLabel;
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = self.createLabel([UIFont systemFontOfSize:14.f]);

    }
    return _dateLabel;
}

- (void)awakeFromNib {
    // Initialization code
}


#pragma mark - public

- (void)updateWithModel:(id )model
{

    [self yzt_configCellWithData:model];
}


+ (CGFloat)cellHeight:(YZTNewsRecommendFinanceDynamicModel *)model
{
    CGFloat height = 0.f;
    height += 10.f;//顶部空隙
    if ([self contentHeight:attributeSting(model.content)] <= kContentLabelMaxHeight) {
        height += [self contentHeight:attributeSting(model.content)];
        if (model.imageUrls.count >= 1) {
            height += kImageDefaultHeight *model.imageUrls.count + kImageViewMargin *(model.imageUrls.count - 1);
            height += 5.f;
        }
    } else {
        if (model.isShowAll) {
            height += [self contentHeight:attributeSting(model.content)];
        } else {
            height += kContentLabelMaxHeight;
        }
        height += 15.f;//展开按钮高度
        height += (kImageDefaultHeight + kImageViewMargin) *model.imageUrls.count;
        height += 5.f;
    }
    height += 15.f;//底部空隙
    return height;
}

#pragma mark - event

- (void)expandBtnActionEvent:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(refreshTableView:)]) {
        [self.delegate refreshTableView:self];
    }
}

- (void)tapImageViewAction:(UITapGestureRecognizer *)tap
{
    UIImageView *iv = (UIImageView *)tap.view;
    if (self.delegate && [self.delegate respondsToSelector:@selector(showZoomImage:image:)]) {
        [self.delegate showZoomImage:self image:iv.image];
    }
}


#pragma mark - private

- (void)yzt_configCellWithData:(YZTNewsRecommendFinanceDynamicModel *)model
{
    [self removeImageView];
    
    self.timeLabel.text = model.time;
    if (model.date && model.date.length > 0) {
        self.dateLabel.text = model.date;
    }
    self.contentLabel.attributedText = attributeSting(model.content);
    
    if (!model.isShowAll) {
        [self.expandBtn setTitle:@"展开" forState:UIControlStateNormal];
    } else {
        [self.expandBtn setTitle:@"收回" forState:UIControlStateNormal];
    }
    
    if ([self.class contentHeight:attributeSting(model.content)] <= kContentLabelMaxHeight) {
        self.expandBtn.hidden = YES;
        [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@([self.class contentHeight:attributeSting(model.content)]));
        }];
    } else {
        self.expandBtn.hidden = NO;
        if (model.isShowAll) {
            [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@([self.class contentHeight:attributeSting(model.content)]));
            }];
        } else {
            [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(kContentLabelMaxHeight));
            }];
        }
    }
    
    UIImageView *tempIV = nil;
    for (int i = 0; i < model.imageUrls.count; i++) {
        
        UIImageView *iv = [[UIImageView alloc] init];
        iv.backgroundColor = [UIColor yellowColor];
        iv.userInteractionEnabled = YES;
        [self.contentView addSubview:iv];
        
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentLabel.mas_leading);
            make.trailing.equalTo(@-10);
            if (tempIV) {
                make.top.equalTo(tempIV.mas_bottom).offset(5);
            } else{
                if (self.expandBtn.hidden) {
                    make.top.equalTo(self.contentLabel.mas_bottom).offset(5);
                } else{
                    make.top.equalTo(self.expandBtn.mas_bottom).offset(5);
                }
            }
            make.height.equalTo(@(kImageDefaultHeight));
        }];
        
        tempIV = iv;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageViewAction:)];
        [iv addGestureRecognizer:tap];
    }
}

+ (CGFloat)contentHeight:(NSAttributedString *)text
{
    return [text boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - kViewLeftAndRightMargin *3 - kTimeLabelWidth - 5.f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine context:nil].size.height + 1.f;
}

- (void)removeImageView
{
    for (UIView *v in self.contentView.subviews) {
        if ([v isKindOfClass:[UIImageView class]]) {
            [v removeFromSuperview];
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

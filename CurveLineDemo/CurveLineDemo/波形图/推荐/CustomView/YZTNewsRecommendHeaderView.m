//
//  YZTNewsRecommendHeaderView.m
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendHeaderView.h"
#define Byte 2
#define TopLineHeight 0.5
#define BottomLineHeight 0.5
#define LeftMaigin 28/Byte
#define HeaderHeight 44
#define HeaderImageHeight 14
#define HeaderImageWidth 14
#define HeaderNameHeight 30
#define HeaderNameWidth 45
@implementation YZTNewsRecommendHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initDefault];
    }
    return self;
}

- (void)initDefault{
    
    _headerTopLineView = [[UIView alloc] init];
//    _headerTopLineView.backgroundColor = [UIColor yzt_colorWithHexString:@"#cccccc"];
    [self addSubview:_headerTopLineView];
    [_headerTopLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.top.equalTo(self.mas_top).with.offset(0);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(TopLineHeight);
    }];
    
    UIView *lineViewForhideNativeSperaterLine = [[UIView alloc] init];
     lineViewForhideNativeSperaterLine.backgroundColor =[UIColor grayColor];
//    lineViewForhideNativeSperaterLine.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineViewForhideNativeSperaterLine];
    [lineViewForhideNativeSperaterLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).with.offset(HeaderHeight);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(BottomLineHeight);
    }];
    
    _headerBottomLineView = [[UIView alloc] init];
    _headerBottomLineView.backgroundColor = [UIColor grayColor];
//    _headerBottomLineView.backgroundColor = [UIColor yzt_colorWithHexString:@"#cccccc"];
    //    _headerBottomLineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_headerBottomLineView];
    [_headerBottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LeftMaigin);
        make.top.equalTo(self.mas_top).with.offset(HeaderHeight);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width-(56/Byte));
        make.height.mas_equalTo(BottomLineHeight);
    }];
    
    _headerImageView = [[UIImageView alloc] init];
    [self addSubview:_headerImageView];
//    _headerImageView.image = IMG_NAME(@"baokuan");
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).with.offset(LeftMaigin);
        make.width.mas_equalTo(HeaderImageWidth);
        make.height.mas_equalTo(HeaderImageHeight);
    }];
    
    _headerNameLabel = [[UILabel alloc] init];
    _headerNameLabel.font = [UIFont systemFontOfSize:14.f];
//    _headerNameLabel.textColor = [UIColor yzt_colorWithHexString:@"#4a4a4a"];
    [self addSubview:_headerNameLabel];
    [_headerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        if ( _headerImageView.image) {
          
            make.left.equalTo(_headerImageView.mas_right).with.offset(LeftMaigin);
           
        }else{
            make.left.equalTo(self.mas_left).offset(15.f);
        }
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(15.f);

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

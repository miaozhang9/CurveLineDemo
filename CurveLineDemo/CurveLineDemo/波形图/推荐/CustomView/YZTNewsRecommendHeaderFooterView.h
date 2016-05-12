//
//  YZTNewsRecommendHeaderView.h
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface YZTNewsRecommendHeaderFooterView : UIView
@property(nonatomic,strong) UIImageView *headerImageView;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UIView *topLineView;
@property(nonatomic,strong) UIView *bottomLineView;
@property(nonatomic,assign) BOOL isFooter;
- (instancetype)initWithFrame:(CGRect)frame isFooter:(BOOL)isFooter;
@end

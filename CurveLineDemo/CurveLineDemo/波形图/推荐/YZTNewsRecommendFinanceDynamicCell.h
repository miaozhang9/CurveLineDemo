//
//  YZTNewsRecommendFinanceDynamicCell.h
//  CurveLineDemo
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZTNewsRecommendFinanceDynamicModel.h"

@protocol YZTNewsRecommendFinanceDynamicCellDelegate <NSObject>

- (void)refreshTableView:(id )cell;
- (void)showZoomImage:(id )cell image:(UIImage *)image;
@end

@interface YZTNewsRecommendFinanceDynamicCell : UITableViewCell
@property (nonatomic, weak) id <YZTNewsRecommendFinanceDynamicCellDelegate> delegate;;

- (void)updateWithModel:(id )model;
+ (CGFloat)cellHeight:(YZTNewsRecommendFinanceDynamicModel *)model;
@end

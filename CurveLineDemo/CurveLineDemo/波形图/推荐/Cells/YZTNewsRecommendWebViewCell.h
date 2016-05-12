//
//  YZTNewsRecommendWebViewCell.h
//  CurveLineDemo
//
//  Created by apple on 16/5/12.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YZTNewsRecommendModel.h"
typedef void (^WebViewCellFinishBlock)(id object);
@interface YZTNewsRecommendWebViewCell : UITableViewCell
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, copy) WebViewCellFinishBlock webViewFinishBlock;

@property(nonatomic,strong)YZTNewsRecommendModel *model;
@end

//
//  YZTNewsRecommendWebViewCell.m
//  CurveLineDemo
//
//  Created by apple on 16/5/12.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTNewsRecommendWebViewCell.h"
#import "Masonry.h"

@interface YZTNewsRecommendWebViewCell()<UIWebViewDelegate>

@property (nonatomic, strong) UIView *bottomLineView;
@end

@implementation YZTNewsRecommendWebViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubviews];
        [self defineLayout];
    }
    return self;
}

- (void)addSubviews {
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectZero];
    webView.backgroundColor = [UIColor clearColor];
    webView.scrollView.scrollEnabled = NO;
    webView.delegate = self;
    [webView sizeToFit];
//    webView.opaque = NO;
    webView.userInteractionEnabled = NO;
//    webView.scrollView.bounces = NO;
//    webView.paginationBreakingMode = UIWebPaginationBreakingModePage;
//    webView.scalesPageToFit = YES;
    _webView = webView;
    [self.contentView addSubview:webView];
    
    
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [UIColor grayColor];
    _bottomLineView = bottomLineView;
    [self.contentView addSubview:bottomLineView];
  
}

- (void)defineLayout {
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.top.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0.5);
//        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0.f, 0.f, 0.5f, 0.f));
    }];
    
    [self.bottomLineView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.equalTo(@0.5);
    }];

}
-(void)setModel:(YZTNewsRecommendModel *)model {
    _model = model;
     [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_model.url]]];
    
}

#pragma mark - UIWebView Delegate Methods
-(void)webViewDidFinishLoad:(UIWebView *)webView
{

    // 如果要获取web高度必须在网页加载完成之后获取
    
    // 方法一
//    CGSize fittingSize = [self.webView sizeThatFits:CGSizeZero];
    
    // 方法二
        CGSize fittingSize = webView.scrollView.contentSize;
    NSLog(@"webView:%@",NSStringFromCGSize(fittingSize));
    
    if (_model.height.integerValue != fittingSize.height && _model.height.integerValue<190) {
        
         _model.height = [NSString stringWithFormat:@"%f",fittingSize.height];
        if (_webViewFinishBlock) _webViewFinishBlock(self);
    }
   
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    NSLog(@"didFailLoadWithError===%@", error);
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

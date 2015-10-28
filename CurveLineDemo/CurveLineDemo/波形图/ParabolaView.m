//
//  ParabolaView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "ParabolaView.h"
#define  ReducedHeight 0
@implementation ParabolaView
{
    CAShapeLayer  *waveLayer1;
    CAShapeLayer  *waveLayer2;
    CADisplayLink *waveDisplaylink1;
    CADisplayLink *waveDisplaylink2;
    ParabolaView *animationView;
    CGFloat        offsetX1;
    CGFloat        offsetX2;
    CGFloat        animationPercentage;
    CGFloat        waveHeight;//控制波浪高度




}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        
        
    }
    return self;
}



- (void)drawRect:(CGRect)rect {
    
    animationView = self;
    animationPercentage = 1.0f;
    waveHeight = animationView.frame.size.height-ReducedHeight;

    // Drawing code
    UIColor *color = [UIColor whiteColor];
    [color set]; //设置线条颜色
//抛物线效果
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    
//    aPath.lineWidth =1.0;
//    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//    
//    [aPath moveToPoint:CGPointMake(0, animationView.frame.size.height)];
//    [aPath addQuadCurveToPoint:CGPointMake(animationView.frame.size.width, animationView.frame.size.height) controlPoint:CGPointMake(0+animationView.frame.size.width/2, -animationView.frame.size.height)];//animationView.frame.size.height
//    [aPath stroke];

   
    //三角形顶部圆角效果
    CGFloat lineoffsetwidth = 4.50f;
//    CGFloat curveoffsetwidth = 5.0f;
    UIBezierPath* aPath = [UIBezierPath bezierPath];
  
    [aPath moveToPoint: CGPointMake(0, animationView.frame.size.height)];//
     aPath.lineCapStyle = kCGLineCapRound; //线条拐角  
//    [aPath addArcWithCenter:CGPointMake(animationView.frame.size.width/2,animationView.frame.size.height- animationView.frame.size.height  +2)
//                          radius:2
//                      startAngle:M_PI*1.1
//                        endAngle:M_PI*1.9
//                       clockwise:YES];
  
//    [aPath addLineToPoint: CGPointMake(animationView.frame.size.width/2 + 2, animationView.frame.size.height- animationView.frame.size.height  +2/2)];
//     [aPath addLineToPoint: CGPointMake(animationView.frame.size.width/2 , animationView.frame.size.height- animationView.frame.size.height  +2/2)];
    [aPath addLineToPoint: CGPointMake(animationView.frame.size.width/2 -lineoffsetwidth , lineoffsetwidth)];
    [aPath addLineToPoint: CGPointMake(animationView.frame.size.width/2 +lineoffsetwidth , lineoffsetwidth)];
    
    [aPath addLineToPoint: CGPointMake(animationView.frame.size.width, animationView.frame.size.height)];
    
    aPath.lineWidth =0.5;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理

    [aPath moveToPoint:CGPointMake(animationView.frame.size.width/2-lineoffsetwidth,lineoffsetwidth )];//animationView.frame.size.height/16
    [aPath addQuadCurveToPoint:CGPointMake(animationView.frame.size.width/2+lineoffsetwidth,lineoffsetwidth ) controlPoint:CGPointMake(animationView.frame.size.width/2, -lineoffsetwidth)];//animationView.frame.size.height//animationView.frame.size.height/16
    
    [aPath stroke];
//
   
    [self wave];
    //创建圆形遮罩，把用户头像变成圆形
//    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES];
    CAShapeLayer* shape = [CAShapeLayer layer];
    shape.path = aPath.CGPath;
    self.layer.mask = shape;
    
   
}
-(void) wave
{
    
    waveLayer1 = [CAShapeLayer layer];
    waveLayer1.fillColor = [UIColor colorWithRed:255/255. green:153/255. blue:0 alpha:1].CGColor;
    
    [animationView.layer addSublayer:waveLayer1];
    waveDisplaylink1 = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave1:)];
    [waveDisplaylink1 addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
//    waveLayer2 = [CAShapeLayer layer];
//    waveLayer2.fillColor = [UIColor colorWithRed:255/255. green:102/255. blue:0 alpha:1].CGColor;
//    [animationView.layer addSublayer:waveLayer2];
//    waveDisplaylink2 = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave2:)];
//    [waveDisplaylink2 addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

static CGFloat waveSpeed1 = 2.5;// 控制波浪的快慢
-(void)getCurrentWave1:(CADisplayLink *)displayLink{
    
    offsetX1 +=waveSpeed1;
    waveLayer1.path = [self getgetCurrentWavePath1];

    
   }
static CGFloat waveSpeed2 = 2.5;// 控制波浪的快慢
-(void)getCurrentWave2:(CADisplayLink *)displayLink{
    
    offsetX2 +=waveSpeed2;
    waveLayer2.path = [self getgetCurrentWavePath2];

 
}


static CGFloat waveAmplitude = 3.0f; // 波浪的震荡幅度
-(CGPathRef)getgetCurrentWavePath1
{
 
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, animationView.frame.size.height-ReducedHeight);
    CGFloat y = 0.0f;
    
    for (float x = 0.0f; x <= animationView.frame.size.width-ReducedHeight; x++) {
        y = waveAmplitude*sinf((360/(animationView.frame.size.width/2-ReducedHeight)) *(x * M_PI /180) - offsetX1 * M_PI / 180)+waveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil,animationView.frame.size.width-ReducedHeight,animationView.frame.size.height-ReducedHeight);
    CGPathAddLineToPoint(path, nil, 0,animationView.frame.size.height-ReducedHeight);

    
    CGPathCloseSubpath(path);
    
    p.CGPath = path;
    
   
    if (waveHeight <= animationView.frame.size.height - _currentCoverageHeight.floatValue) {
        waveHeight = animationView.frame.size.height - _currentCoverageHeight.floatValue;
    }
        if (waveHeight > (animationView.frame.size.height-ReducedHeight)*(1-animationPercentage))
    {
        waveHeight = waveHeight-(animationView.frame.size.height-ReducedHeight)/(animationPercentage*500.0);
    }
    else
    {
        waveHeight = (animationView.frame.size.height-ReducedHeight)*(1-animationPercentage);
        
    }
    

    return path;
}
-(CGPathRef)getgetCurrentWavePath2
{
    
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, animationView.frame.size.height-ReducedHeight);
    CGFloat y = 0.0f;
    
    for (float x = 0.0f; x <= animationView.frame.size.width-ReducedHeight; x++) {
        y = waveAmplitude*cosf((360/(animationView.frame.size.width-ReducedHeight)) *(x * M_PI /180) + offsetX2 * M_PI / 180)+waveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil,animationView.frame.size.width-ReducedHeight,animationView.frame.size.height-ReducedHeight);
    CGPathAddLineToPoint(path, nil, 0,animationView.frame.size.height-ReducedHeight);
    CGPathCloseSubpath(path);
    
    p.CGPath = path;
    
    
    return path;
}


@end

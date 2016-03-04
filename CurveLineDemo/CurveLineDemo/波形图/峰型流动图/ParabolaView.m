//
//  ParabolaView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue &0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00)>> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
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
    
  
    animationView           = self;
    animationPercentage     = 1.0f;
    //    if (_currentCoverageHeight.floatValue == 0) {
    //        waveHeight = animationView.frame.size.height-ReducedHeight+5;
    //    }else{
    waveHeight              = animationView.frame.size.height-ReducedHeight;
    //    }
     [self wave];

    // Drawing code
    UIColor *color          = [UIColor whiteColor];
    [color set];
    //三角形顶部圆角效果
    CGFloat lineoffsetwidth = 4.50f;
    //    CGFloat curveoffsetwidth = 5.0f;
    UIBezierPath* aPath     = [UIBezierPath bezierPath];
    aPath.lineWidth         = 0.5;
    aPath.lineCapStyle      = kCGLineCapRound;//线条拐角
    aPath.lineJoinStyle     = kCGLineCapRound;//终点处理
    [aPath moveToPoint: CGPointMake(0, animationView.frame.size.height-ReducedHeight)];
    [aPath addLineToPoint: CGPointMake(animationView.frame.size.width/2 -lineoffsetwidth , lineoffsetwidth)];
    [aPath addLineToPoint: CGPointMake(animationView.frame.size.width/2 +lineoffsetwidth , lineoffsetwidth)];
    [aPath addLineToPoint: CGPointMake(animationView.frame.size.width, animationView.frame.size.height-ReducedHeight)];
    [aPath moveToPoint:CGPointMake(animationView.frame.size.width/2-lineoffsetwidth,lineoffsetwidth )];
    [aPath addQuadCurveToPoint:CGPointMake(animationView.frame.size.width/2+lineoffsetwidth,lineoffsetwidth )
                  controlPoint:CGPointMake(animationView.frame.size.width/2, -lineoffsetwidth)];
    [aPath stroke];

    CAShapeLayer* shape     = [CAShapeLayer layer];
    shape.path              = aPath.CGPath;
    self.layer.mask         = shape;
}
-(void)dealloc{
    

}
-(void) wave
{
    if (!waveLayer1) {
        waveLayer1           = [CAShapeLayer layer];
        waveLayer1.fillColor = UIColorFromRGB(0xffc8a3).CGColor;
        //    [UIColor colorWithRed:255/255. green:153/255. blue:0 alpha:1].CGColor;

        [animationView.layer addSublayer:waveLayer1];
        waveDisplaylink1     = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave1:)];
        [waveDisplaylink1 addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
  
//    waveLayer2 = [CAShapeLayer layer];
//    waveLayer2.fillColor = [UIColor colorWithRed:255/255. green:102/255. blue:0 alpha:1].CGColor;
//    [animationView.layer addSublayer:waveLayer2];
//    waveDisplaylink2 = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave2:)];
//    [waveDisplaylink2 addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)stopWave{
    [waveDisplaylink1 invalidate];
   

}
static CGFloat waveSpeed1 = 2.5;// 控制波浪的快慢
- (void)getCurrentWave1:(CADisplayLink *)displayLink{
    
    offsetX1        += waveSpeed1;
    waveLayer1.path = [self getgetCurrentWavePath1];
}
static CGFloat waveSpeed2 = 2.5;// 控制波浪的快慢
- (void)getCurrentWave2:(CADisplayLink *)displayLink{
    
    offsetX2        += waveSpeed2;
    waveLayer2.path = [self getgetCurrentWavePath2];
}

static CGFloat waveVAmplitude = 3.0f; // 波浪的震幅 （越小越平）
static CGFloat waveHAmplitude = 0.0f; // 波浪的波长 （越大越短）

- (CGPathRef)getgetCurrentWavePath1
{

    UIBezierPath *p       = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, animationView.frame.size.height-ReducedHeight);
    CGFloat y             = 0.0f;
    for (float x = 0.0f; x <= animationView.frame.size.width; x++) {
        y = waveVAmplitude*sinf((360/(animationView.frame.size.width-waveHAmplitude-ReducedHeight)) *(x * M_PI /180) - offsetX1 * M_PI / 180)+waveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil,animationView.frame.size.width,animationView.frame.size.height-ReducedHeight);
    CGPathAddLineToPoint(path, nil, 0,animationView.frame.size.height-ReducedHeight);
//    CGPathAddLineToPoint(path, nil, 0,waveHeight);

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
        waveHeight = (animationView.frame.size.height-ReducedHeight)*(1-animationPercentage)-5;
        
    }

    
   
    

    return path;
}
- (CGPathRef)getgetCurrentWavePath2
{
    
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, animationView.frame.size.height-ReducedHeight);
    CGFloat y = 0.0f;
    
    for (float x = 0.0f; x <= animationView.frame.size.width; x++) {//-ReducedHeight
        y = waveVAmplitude*cosf((360/(animationView.frame.size.width-ReducedHeight)) *(x * M_PI /180) + offsetX2 * M_PI / 180)+waveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil,animationView.frame.size.width,animationView.frame.size.height-ReducedHeight);//-ReducedHeight
    CGPathAddLineToPoint(path, nil, 0,animationView.frame.size.height-ReducedHeight);
    CGPathCloseSubpath(path);
    
    p.CGPath = path;
    
    
    return path;
}


@end

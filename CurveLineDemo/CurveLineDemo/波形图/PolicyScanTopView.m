//
//  PolicyScanTopView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "PolicyScanTopView.h"
#import "ParabolaView.h"
#import "WaveScaleView.h"
#import "StarStripesView.h"
@implementation PolicyScanTopView
{

    WaveScaleView *waveScaleView;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        [self createLabel];
        WaveScaleView *view = [[WaveScaleView alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 250)];
        view.backgroundColor = [UIColor blueColor];
        waveScaleView= view;
        [self addSubview:view];
        
        StarStripesView *starView = [[StarStripesView alloc] initWithFrame:CGRectMake(0, view.frame.origin.y+view.frame.size.height, self.frame.size.width, 150)];
        [self addSubview:starView];
//        [self createParabolaViewY:60   withX:70];
    }
    return self;
}

-(void)createLabel{

    UIView *leftColorview = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-80, 15, 15, 15)];
    leftColorview.backgroundColor = [UIColor blackColor];
    [self addSubview:leftColorview];
    
    UILabel *leftlab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-60, 10, 60, 20)];
    leftlab.backgroundColor = [UIColor redColor];
    leftlab.textAlignment = NSTextAlignmentCenter;
    leftlab.font = [UIFont boldSystemFontOfSize:12.0f];
    leftlab.textColor = [UIColor whiteColor];
    leftlab.text = @"当前覆盖";
    [self addSubview:leftlab];

    UIView *rightColorview = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2+10, 15, 15, 15)];
    rightColorview.backgroundColor = [UIColor whiteColor];
    [self addSubview:rightColorview];
    
    UILabel *rightlab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2+30, 10, 60, 20)];
    rightlab.backgroundColor = [UIColor blueColor];
    rightlab.textAlignment = NSTextAlignmentCenter;
    rightlab.font = [UIFont boldSystemFontOfSize:12.0f];
    rightlab.textColor = [UIColor whiteColor];
    rightlab.text = @"建议覆盖";
    [self addSubview:rightlab];

    [self createScalelineY:leftlab.frame.origin.y+leftlab.frame.size.height+20];
}
-(void)createParabolaViewY:(CGFloat)y withX:(CGFloat)x{
    for (NSInteger i = 0; i<3; i++) {
        ParabolaView *view = [[ParabolaView alloc] init];
        switch (i) {
            case 0:
                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",160];
                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y, 60, 160);
                break;
                
            case 1:
                                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",160];
                 view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+40, 60, 120);
                break;
            case 2:
                                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",160];
                 view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+80, 60, 80);
                break;

            default:
                break;
        }
       
        [waveScaleView addSubview:view];//self.frame.size.height - 200

    }
}
-(void)createScalelineY:(CGFloat)y{
    
    for (NSInteger i = 0; i < 5 ; i++) {
        UILabel *tmplab = [[UILabel alloc] initWithFrame:CGRectMake(15, y+39*i, 30, 20)];
        tmplab.backgroundColor = [UIColor clearColor];
        tmplab.textAlignment = NSTextAlignmentCenter;
        tmplab.font = [UIFont boldSystemFontOfSize:12.0f];
        tmplab.textColor = [UIColor whiteColor];
        tmplab.text = [NSString stringWithFormat:@"%ld0万",4-i];
        [self addSubview:tmplab];
        
        UIView *lineView = [[UIView alloc] init];
        if (i != 4) {
             lineView.frame = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+10, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - 100, 0.5);
        }else{
            lineView.frame = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+10, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - 100, 1.0f);
           
        }
        lineView.backgroundColor = [UIColor whiteColor];
        lineView.alpha = 0.5;
        
        [self addSubview:lineView];

//            [self createParabolaViewY:lineView.frame.origin.y-2.5 withX:lineView.frame.origin.x+lineView.frame.size.width];
        

    }
    


}

@end

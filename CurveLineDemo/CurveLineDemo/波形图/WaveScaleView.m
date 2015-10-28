//
//  WaveScaleView.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "WaveScaleView.h"
#import "ParabolaView.h"
@implementation WaveScaleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createLabel];
        
    }
    return self;
}

-(void)createLabel{
    
    UIView *leftColorview = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-80, 12.5, 15, 15)];
    leftColorview.backgroundColor = [UIColor blackColor];
    [self addSubview:leftColorview];
    
    UILabel *leftlab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-60, 10, 60, 20)];
    leftlab.backgroundColor = [UIColor redColor];
    leftlab.textAlignment = NSTextAlignmentCenter;
    leftlab.font = [UIFont boldSystemFontOfSize:12.0f];
    leftlab.textColor = [UIColor whiteColor];
    leftlab.text = @"当前覆盖";
    [self addSubview:leftlab];
    
    UIView *rightColorview = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2+10, 12.5, 15, 15)];
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
-(void)createScalelineY:(CGFloat)y{
    
    for (NSInteger i = 0; i < 5 ; i++) {
        UILabel *tmplab = [[UILabel alloc] initWithFrame:CGRectMake(15, y+40*i, 30, 20)];
        tmplab.backgroundColor = [UIColor clearColor];
        tmplab.textAlignment = NSTextAlignmentCenter;
        tmplab.font = [UIFont boldSystemFontOfSize:12.0f];
        tmplab.textColor = [UIColor whiteColor];
        tmplab.text = [NSString stringWithFormat:@"%ld0万",4-i];
        [self addSubview:tmplab];
        
        UIView *lineView = [[UIView alloc] init];
        if (i != 4) {
            lineView.frame = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+5, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - (tmplab.frame.origin.x+tmplab.frame.size.width+5)-20, 0.5);
        }else{
            lineView.frame = CGRectMake(tmplab.frame.origin.x+tmplab.frame.size.width+5, tmplab.frame.origin.y+tmplab.frame.size.height/2, self.frame.size.width - (tmplab.frame.origin.x+tmplab.frame.size.width+5)-20, 1.0f);
        }
        lineView.backgroundColor = [UIColor whiteColor];
        lineView.alpha = 0.5;
        
        [self addSubview:lineView];
    }
    
    [self createParabolaViewY:60 withX:70];
}
-(void)createParabolaViewY:(CGFloat)y withX:(CGFloat)x{
    NSArray *titleArray = @[@"意外险",@"健康险",@"寿险"];
    for (NSInteger i = 0; i<3; i++) {
        ParabolaView *view = [[ParabolaView alloc] init];

        switch (i) {
            case 0:
                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",3*40];
                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y, 60, 160);
                
                
                break;
                
            case 1:
                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",2*40];
                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+80, 60, 80);
                break;
            case 2:
                view.currentCoverageHeight = [NSString stringWithFormat:@"%d",40];
                view.frame = CGRectMake(60+i*(60+(self.frame.size.width-50-3*60)/3), y+120, 60, 40);
                break;
                
            default:
                break;
        }
        [self addSubview:view];//self.frame.size.height - 200
       
        UILabel *tmpLab = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y+view.frame.size.height+10, view.frame.size.width, 20)];
        tmpLab.textColor = [UIColor whiteColor];
        tmpLab.font = [UIFont boldSystemFontOfSize:14.0f];
        tmpLab.textAlignment = NSTextAlignmentCenter;
        tmpLab.text = titleArray[i];
        [self addSubview:tmpLab];
    }
}

@end

//
//  PolicyScanAdvertiseCell.m
//  CurveLineDemo
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "PolicyScanAdvertiseCell.h"

@implementation PolicyScanAdvertiseCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createImageView];
    }
    return self;
}
-(void)createImageView{
    UIImageView *adImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width+100, 100)];
    adImgView.backgroundColor = [UIColor redColor];
    [self addSubview:adImgView];

}
@end

//
//  PolicyScanWordCell.m
//  CurveLineDemo
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "PolicyScanWordCell.h"

@implementation PolicyScanWordCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createLabel];
          }
    return self;
}
-(void)createLabel{
    UILabel *toplab = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.frame.size.width, 20)];
    toplab.font = [UIFont boldSystemFontOfSize:14.0f];
    toplab.textColor = [UIColor blackColor];
    toplab.text = @"子女尚小,临近退休";
    [self addSubview:toplab];
    
    UILabel *bottomlab = [[UILabel alloc] initWithFrame:CGRectMake(toplab.frame.origin.x, toplab.frame.origin.y+toplab.frame.size.height+5, self.frame.size.width, 20)];
    bottomlab.font = [UIFont boldSystemFontOfSize:14.0f];
    bottomlab.textColor = [UIColor blackColor];
    bottomlab.text = @"你的状态";
    [self addSubview:bottomlab];
    
}

@end

//
//  YZTSafetyProtectViewController.m
//  CurveLineDemo
//
//  Created by apple on 15/9/6.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "YZTSafetyProtectViewController.h"
#import "YZTSafetyProtectView.h"
@interface YZTSafetyProtectViewController ()

@end

@implementation YZTSafetyProtectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createShowView];
}

- (void)createShowView {
    
    YZTSafetyProtectView * view = [[YZTSafetyProtectView alloc] initWithFrame:
                                   CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:view];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

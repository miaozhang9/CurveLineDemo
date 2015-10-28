//
//  ViewController.m
//  CurveLineDemo
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "ViewController.h"
#import "ParabolaView.h"
#import "PolicyScanTopView.h"
#import "PolicyScanWordCell.h"
#import "PolicyScanAdvertiseCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor orangeColor];

    PolicyScanTopView *topView = [[PolicyScanTopView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 384)];
    topView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:topView];
    [self createTableViewY:topView.frame.origin.y+topView.frame.size.height];
//    view.layer.masksToBounds = YES;
//    animationView = view;
    
}
-(void)createTableViewY:(CGFloat)y{
    _tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, y, self.view.frame.size.width,  self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
 
    [self.view addSubview:self.tableView];

}

#pragma mark - table delegate /datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 2;
    }else{
        return 3;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
           return [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 60.0f;
    }
    else{
    
        return 100.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row < 2) {
        static NSString *cellIdentifier = @"PolicyScanWordCell";
        PolicyScanWordCell *cell = (PolicyScanWordCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[PolicyScanWordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        
        return cell;
    }else{
        static NSString *cellIdentifier = @"PolicyScanAdvertiseCell";
        PolicyScanAdvertiseCell *cell = (PolicyScanAdvertiseCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[PolicyScanAdvertiseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        
        return cell;
    
    
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

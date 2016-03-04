//
//  LuJinSuoViewController.m
//  CurveLineDemo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "LuJinSuoViewController.h"
#import "Masonry.h"
#import "LuJinSuoProductCell.h"
#import "LuJinSuoOrderCell.h"
#import "LuJinSuoOrderDetailCell.h"

@interface LuJinSuoViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation LuJinSuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubviews];
    [self defineLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSubviews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.view addSubview:_tableView];
    }

- (void)defineLayout {
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}


#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 150.0f;
    }
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   }

#pragma mark - DataSource

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
    LuJinSuoProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    if (!cell) {
        
        cell = [[LuJinSuoProductCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
  
    
    return cell;
    
    } else  if (indexPath.row == 1){
        
        LuJinSuoOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId2"];
        
        if (!cell) {
            
            cell = [[LuJinSuoOrderCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId2"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        return cell;
        
    }
    else {
        LuJinSuoOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId3"];
        
        if (!cell) {
            
            cell = [[LuJinSuoOrderDetailCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId3"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        return cell;
        
        
    }
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

//
//  LuJinSuoViewController.m
//  CurveLineDemo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTLuJinSuoProductListViewController.h"
#import "Masonry.h"
#import "YZTLuJinSuoProductCell.h"
#import "YZTLuJinSuoOrderCell.h"
#import "YZTLuJinSuoOrderDetailCell.h"


@interface YZTLuJinSuoProductListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation YZTLuJinSuoProductListViewController

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
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [self.view addSubview:_tableView];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
        //    _tableView.separatorColor = RGB(204, 204, 204);
    }
   
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
        return 44.0f;
    }
    return 104;
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
    YZTLuJinSuoProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    if (!cell) {
        
        cell = [[YZTLuJinSuoProductCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
  
    
    return cell;
    
    } else  if (indexPath.row == 1){
        
        YZTLuJinSuoOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId2"];
        
        if (!cell) {
            
            cell = [[YZTLuJinSuoOrderCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId2"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        return cell;
        
    }
    else if (indexPath.row == 2) {
        
        YZTLuJinSuoOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId3"];
        
        if (!cell) {
            
            cell = [[YZTLuJinSuoOtherCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId3"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        return cell;

        
    }
    else {
        YZTLuJinSuoOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId4"];
        
        if (!cell) {
            
            cell = [[YZTLuJinSuoOrderDetailCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId4"];
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

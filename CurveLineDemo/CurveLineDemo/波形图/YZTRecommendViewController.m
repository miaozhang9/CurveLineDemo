//
//  YZTRecommendViewController.m
//  CurveLineDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTRecommendViewController.h"
#import "Masonry.h"
#import "YZTNewsRecommendPersonalDynamicCell.h"
#import "YZTNewsRecommendTodayEarlyNewsCell.h"
#import "YZTNewsRecommendHotSpotAnalysisCell.h"
#import "YZTNewsRecommendInterestTopicCell.h"
#import "YZTNewsRecommendTodayFortuneCell.h"
#import "YZTNewsRecommendFinanceCalendarCell.h"
#import "YZTNewsRecommendNoLoginShowCell.h"
#import "YZTNewsRecommendFinanceDynamicCell.h"
#import "YZTNewsRecommendFinanceCalendarCell2.h"
@interface YZTRecommendViewController ()<UITableViewDataSource, UITableViewDelegate,SWTableViewCellDelegate,YZTNewsRecommendFinanceDynamicCellDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableDictionary *selectedIndexes;
@property (nonatomic, assign)BOOL isLogin;
@property (nonatomic, strong)YZTNewsRecommendFinanceDynamicModel *financeDynamicModel;
@property (nonatomic, strong)YZTNewsRecommendFinanceCalendarModel *financeCalendarModel;
@end

@implementation YZTRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _selectedIndexes = [NSMutableDictionary new];
    [self getData];

    [self addSubviews];
    [self defineLayout];
}

- (void)getData{

    _financeDynamicModel = [YZTNewsRecommendFinanceDynamicModel new];
    _financeDynamicModel.time = @"10:00";
    //    _financeDynamicModel.date = @"2014年4月4日";
    _financeDynamicModel.content = @"O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~";
    _financeDynamicModel.imageUrls = @[@"2222"];
    
    
    YZTNewsRecommendFinanceCalendarModel *model = [YZTNewsRecommendFinanceCalendarModel new];
    model.time = @"15:15\n已公布";
    model.currentValue = @"50.8";
    model.previousValue = @"51.3";
    model.forecastValue = @"--";
    model.content = @"你你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好";
    _financeCalendarModel = model;
}
- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {
    NSNumber *selectedIndex = [self.selectedIndexes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE :[selectedIndex boolValue];
    
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
//        [_tableView registerClass:[YZTNewsRecommendInterestTopicCell class] forCellReuseIdentifier:@"YZTNewsRecommendInterestTopicCell"];
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
    return 30.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.section == 0) {
        return 160;
    }else if (indexPath.section == 1){
        return 125;
    }else if (indexPath.section == 2){
        return 112;
    }else if (indexPath.section == 3){

        if ([self cellIsSelected:indexPath]) {

            return 150 + 64*3;
        }else{
            return 150;
        }

    }
    else if (indexPath.section == 4){
        return 180;
    }
    else if (indexPath.section == 5){
        return 80;
    }else if (indexPath.section == 6){
        
        return [YZTNewsRecommendFinanceDynamicCell cellHeight:_financeDynamicModel];
    }
    else if (indexPath.section == 7){
        
        return [YZTNewsRecommendFinanceCalendarCell2 cellHeight:_financeCalendarModel];
    }
    
    
    else {
        return 0;
    }
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 8;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        if (_isLogin) {
            YZTNewsRecommendPersonalDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId0"];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendPersonalDynamicCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId0"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            
            return cell;

        }else{
            
            YZTNewsRecommendNoLoginShowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YZTNewsRecommendNoLoginShowCell"];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendNoLoginShowCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"YZTNewsRecommendNoLoginShowCell"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            
            return cell;
        
        }
        
        
    }
    if (indexPath.section == 1) {
        YZTNewsRecommendTodayEarlyNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId1"];
        
        if (!cell) {
            
            cell = [[YZTNewsRecommendTodayEarlyNewsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId1"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setLeftUtilityButtons:[self leftButtons] WithButtonWidth:32.0f];
        [cell setRightUtilityButtons:[self rightButtons] WithButtonWidth:58.0f];
        cell.delegate = self;
        
        return cell;
    }
    
    if (indexPath.section == 2) {
        
        YZTNewsRecommendHotSpotAnalysisCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cellId2"];
        
        if (!cell2) {
            
            cell2 = [[YZTNewsRecommendHotSpotAnalysisCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId2"];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        return cell2;
    }
    if (indexPath.section == 3) {
        
      
        YZTNewsRecommendInterestTopicCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"YZTNewsRecommendInterestTopicCell"];
        
        if (!cell3) {
            
            cell3 = [[YZTNewsRecommendInterestTopicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YZTNewsRecommendInterestTopicCell"];
            cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        }
       
        if ([self cellIsSelected:indexPath]) {
            cell3.topicBottomView.hidden = NO;
        }else{
            cell3.topicBottomView.hidden = YES;
        }
        [cell3 setClickChangeBlock:^(id sender){
            
            NSIndexPath *selectIndexPath = [self.tableView indexPathForCell:sender];
            BOOL isSelected = ![self cellIsSelected:selectIndexPath];
            NSNumber *selectIndex = [NSNumber numberWithBool:isSelected];
            [self.selectedIndexes setObject:selectIndex forKey:selectIndexPath];
            [self.tableView reloadRowsAtIndexPaths:@[selectIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
          
          
        }];
        
        
           return cell3;
    }
    if (indexPath.section == 4) {
        
        YZTNewsRecommendTodayFortuneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId4"];
        
        if (!cell) {
            
            cell = [[YZTNewsRecommendTodayFortuneCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId4"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        return cell;
    }
     if (indexPath.section == 5)
 {
        
        YZTNewsRecommendFinanceCalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId5"];
        
        if (!cell) {
            
            cell = [[YZTNewsRecommendFinanceCalendarCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId5"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        return cell;
    }
    if (indexPath.section == 6)
    {
        
        YZTNewsRecommendFinanceDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId6"];
        
        if (!cell) {
            
            cell = [[YZTNewsRecommendFinanceDynamicCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId6"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.delegate = self;
         [cell updateWithModel:_financeDynamicModel];
        
        return cell;
    }
    if (indexPath.section == 7)
    {
        
        YZTNewsRecommendFinanceCalendarCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId7"];
        
        if (!cell) {
            
            cell = [[YZTNewsRecommendFinanceCalendarCell2 alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId7"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell updateWithModel:_financeCalendarModel];
        
        return cell;
    }
    
    
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"More"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"check.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"clock.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"cross.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                icon:[UIImage imageNamed:@"list.png"]];
    
    return leftUtilityButtons;
}


#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state
{
    switch (state) {
        case 0:
            NSLog(@"utility buttons closed");
            break;
        case 1:
            NSLog(@"left utility buttons open");
            break;
        case 2:
            NSLog(@"right utility buttons open");
            break;
        default:
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            NSLog(@"left button 0 was pressed");
            break;
        case 1:
            NSLog(@"left button 1 was pressed");
            break;
        case 2:
            NSLog(@"left button 2 was pressed");
            break;
        case 3:
            NSLog(@"left btton 3 was pressed");
        default:
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            NSLog(@"More button was pressed");
            UIAlertView *alertTest = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"More more more" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles: nil];
            [alertTest show];
            
            [cell hideUtilityButtonsAnimated:YES];
            break;
        }
        case 1:
        {
            // Delete button was pressed
            NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
            
//            [_testArray[cellIndexPath.section] removeObjectAtIndex:cellIndexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        }
        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}

- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    switch (state) {
        case 1:
            // set to NO to disable all left utility buttons appearing
            return YES;
            break;
        case 2:
            // set to NO to disable all right utility buttons appearing
            return YES;
            break;
        default:
            break;
    }
    
    return YES;
}


#pragma mark - YZTLiveProgressCellDelegate


- (void)refreshTableView:(id )cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    YZTNewsRecommendFinanceDynamicModel *model =_financeDynamicModel;
    model.isShowAll = !model.isShowAll;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)showZoomImage:(id)cell image:(UIImage *)image
{
    
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

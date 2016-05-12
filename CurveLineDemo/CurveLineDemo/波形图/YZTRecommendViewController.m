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
#import "YZTNewsRecommendFinanceCalendarCell3.h"
#import "YZTNewsRecommendNoLoginShowCell.h"
#import "YZTNewsRecommendFinanceDynamicCell.h"
#import "YZTNewsRecommendFinanceCalendarCell.h"
#import "YZTNewsRecommendHeaderView.h"

static NSString * const PersonalDynamicCellIdentifier = @"YZTNewsRecommendPersonalDynamicCell";
static NSString * const NoLoginShowCellIdentifier = @"YZTNewsRecommendNoLoginShowCell";
static NSString * const TodayEarlyNewsCellIdentifier = @"YZTNewsRecommendTodayEarlyNewsCell";
static NSString * const InterestTopicCellIdentifier = @"YZTNewsRecommendInterestTopicCell";
static NSString * const HotSpotAnalysisCellIdentifier = @"YZTNewsRecommendHotSpotAnalysisCell";
static NSString * const FinanceDynamicCellIdentifier = @"YZTNewsRecommendFinanceDynamicCell";
static NSString * const TodayFortuneCellIdentifier = @"YZTNewsRecommendTodayFortuneCell";
static NSString * const FinanceCalendarCellIdentifier = @"YZTNewsRecommendFinanceCalendarCell";


typedef NS_ENUM(NSInteger, InvestmentSectionType) {
    PersonalDynamicSection = 0,//最新个人动态
    TodayEarlyNewsSection = 1,//今日早报
    InterestTopicSection  = 2,//感兴趣的话题
    HotSpotAnalysisSection = 3,//热点分析
    FinanceDynamicSection = 4,//财经动态
    TodayFortuneSection = 5,//今日运势
    FinanceCalendarSection = 6,//财经日历
};

@interface YZTRecommendViewController ()<UITableViewDataSource, UITableViewDelegate,SWTableViewCellDelegate,YZTNewsRecommendFinanceDynamicCellDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableDictionary *selectedIndexes;
///临时测试数据
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
    _isLogin = NO;
    [self addSubviews];
    [self defineLayout];
}
///临时测试数据
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

- (void)addSubviews {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.view addSubview:_tableView];
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

- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {
    NSNumber *selectedIndex = [self.selectedIndexes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE :[selectedIndex boolValue];
    
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{


    switch (indexPath.section) {
        case PersonalDynamicSection:
            return 160.f;
            break;
            
        case TodayEarlyNewsSection:
            return 125.f;
            break;
        case InterestTopicSection:
            if ([self cellIsSelected:indexPath]) {
                
                return 150 + 64*3;
            }else{
                return 150;
            }
            break;
        case HotSpotAnalysisSection:
             return 112.f;
            break;
        case FinanceDynamicSection:
            return  [YZTNewsRecommendFinanceDynamicCell cellHeight:_financeDynamicModel];
            break;
        case TodayFortuneSection:
             return 180;
            break;
        case FinanceCalendarSection:
            return [YZTNewsRecommendFinanceCalendarCell cellHeight:_financeCalendarModel];
            break;
        default:
            return 0;
            break;
    }
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YZTNewsRecommendHeaderView *topHeaderView = [[YZTNewsRecommendHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 44)];
    topHeaderView.headerNameLabel.text = @[@"最新的个人动态",@"您必须知道的今日早报",@"您可能会感兴趣的话题",@"值得您一读的热点分析",@"财经动态",@"今日运势",@"最新财经日历"][section];
    
    return topHeaderView;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - DataSource

#pragma mark -- UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case PersonalDynamicSection:
            if (_isLogin) {
                YZTNewsRecommendPersonalDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:PersonalDynamicCellIdentifier];
                
                if (!cell) {
                    
                    cell = [[YZTNewsRecommendPersonalDynamicCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:PersonalDynamicCellIdentifier];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                
                return cell;
                
            }else{
                
                YZTNewsRecommendNoLoginShowCell *cell = [tableView dequeueReusableCellWithIdentifier:NoLoginShowCellIdentifier];
                
                if (!cell) {
                    
                    cell = [[YZTNewsRecommendNoLoginShowCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NoLoginShowCellIdentifier];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                
                return cell;
                
            }
            

            break;
            
        case TodayEarlyNewsSection:
        {
            YZTNewsRecommendTodayEarlyNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:TodayEarlyNewsCellIdentifier];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendTodayEarlyNewsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TodayEarlyNewsCellIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
           
            [cell setRightUtilityButtons:[self rightButtons] WithButtonWidth:58.0f];
            cell.delegate = self;
       
        return cell;
        }
            break;
        case InterestTopicSection:
        {
            YZTNewsRecommendInterestTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:InterestTopicCellIdentifier];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendInterestTopicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InterestTopicCellIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            ///临时写法
            if ([self cellIsSelected:indexPath]) {
                cell.topicBottomView.hidden = NO;
            }else{
                cell.topicBottomView.hidden = YES;
            }
            [cell setClickChangeBlock:^(id sender){
                
                NSIndexPath *selectIndexPath = [self.tableView indexPathForCell:sender];
                BOOL isSelected = ![self cellIsSelected:selectIndexPath];
                NSNumber *selectIndex = [NSNumber numberWithBool:isSelected];
                [self.selectedIndexes setObject:selectIndex forKey:selectIndexPath];
                [self.tableView reloadRowsAtIndexPaths:@[selectIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                
                
            }];
            return cell;

        }
            break;
        case HotSpotAnalysisSection:
        {
            YZTNewsRecommendHotSpotAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:HotSpotAnalysisCellIdentifier];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendHotSpotAnalysisCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:HotSpotAnalysisCellIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            
            return cell;
        
        }
            break;
        case FinanceDynamicSection:
        {
            
            YZTNewsRecommendFinanceDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:FinanceDynamicCellIdentifier];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendFinanceDynamicCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:FinanceDynamicCellIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            cell.delegate = self;
            cell.line01.hidden = indexPath.row == 0;
            [cell updateWithModel:_financeDynamicModel];
            
            return cell;

        }
            break;
        case TodayFortuneSection:
        {
            YZTNewsRecommendTodayFortuneCell *cell = [tableView dequeueReusableCellWithIdentifier:TodayFortuneCellIdentifier];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendTodayFortuneCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TodayFortuneCellIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            
            return cell;
        }
            break;
        case FinanceCalendarSection:
        {
            YZTNewsRecommendFinanceCalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:FinanceCalendarCellIdentifier];
            
            if (!cell) {
                
                cell = [[YZTNewsRecommendFinanceCalendarCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:FinanceCalendarCellIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            [cell updateWithModel:_financeCalendarModel];
            
            return cell;
        
        }
            break;
        default:
            return nil;
            break;
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
                                                title:@"不再\n订阅"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"不再\n显示"];
    
    return rightUtilityButtons;
}
//
//- (NSArray *)leftButtons
//{
//    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
//    
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
//                                                icon:[UIImage imageNamed:@"check.png"]];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
//                                                icon:[UIImage imageNamed:@"clock.png"]];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
//                                                icon:[UIImage imageNamed:@"cross.png"]];
//    [leftUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
//                                                icon:[UIImage imageNamed:@"list.png"]];
//    
//    return leftUtilityButtons;
//}


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

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
#import "YZTNewsRecommendHeaderFooterView.h"
#import "YZTNewsRecommendWebViewCell.h"

static NSString * const PersonalDynamicCellIdentifier = @"YZTNewsRecommendPersonalDynamicCell";
static NSString * const NoLoginShowCellIdentifier = @"YZTNewsRecommendNoLoginShowCell";
static NSString * const TodayEarlyNewsCellIdentifier = @"YZTNewsRecommendTodayEarlyNewsCell";
static NSString * const InterestTopicCellIdentifier = @"YZTNewsRecommendInterestTopicCell";
static NSString * const HotSpotAnalysisCellIdentifier = @"YZTNewsRecommendHotSpotAnalysisCell";
static NSString * const FinanceDynamicCellIdentifier = @"YZTNewsRecommendFinanceDynamicCell";
static NSString * const TodayFortuneCellIdentifier = @"YZTNewsRecommendTodayFortuneCell";
static NSString * const FinanceCalendarCellIdentifier = @"YZTNewsRecommendFinanceCalendarCell";
static NSString * const WebViewCellIdentifier  = @"YZTNewsRecommendWebViewCell";
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

typedef NS_ENUM(NSInteger, RecommendSectionType) {
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
@property (nonatomic,strong) YZTNewsRecommendModel *recommendModel;
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
    
    _recommendModel = [YZTNewsRecommendModel new];
    _recommendModel.url = @"http://www.baidu.com";
}

- (void)addSubviews {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.view addSubview:_tableView];
        
        [_tableView registerClass:[YZTNewsRecommendPersonalDynamicCell class] forCellReuseIdentifier:PersonalDynamicCellIdentifier];
         [_tableView registerClass:[YZTNewsRecommendNoLoginShowCell class] forCellReuseIdentifier:NoLoginShowCellIdentifier];
         [_tableView registerClass:[YZTNewsRecommendTodayEarlyNewsCell class] forCellReuseIdentifier:TodayEarlyNewsCellIdentifier];
         [_tableView registerClass:[YZTNewsRecommendInterestTopicCell class] forCellReuseIdentifier:InterestTopicCellIdentifier];
         [_tableView registerClass:[YZTNewsRecommendHotSpotAnalysisCell class] forCellReuseIdentifier:HotSpotAnalysisCellIdentifier];
         [_tableView registerClass:[YZTNewsRecommendFinanceDynamicCell class] forCellReuseIdentifier:FinanceDynamicCellIdentifier];
        [_tableView registerClass:[YZTNewsRecommendTodayFortuneCell class] forCellReuseIdentifier:TodayFortuneCellIdentifier];
         [_tableView registerClass:[YZTNewsRecommendWebViewCell class] forCellReuseIdentifier:WebViewCellIdentifier];
         [_tableView registerClass:[YZTNewsRecommendFinanceCalendarCell class] forCellReuseIdentifier:FinanceCalendarCellIdentifier];
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    switch (section) {
     
        case InterestTopicSection:
            return 44.f;
            break;
        case HotSpotAnalysisSection:
            return 44.f;
            break;
        case FinanceCalendarSection:
            return 44.f;
            break;
        default:
            return 0.01;
            break;
    }

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
            if (!_recommendModel.height) {
                 return 180;
            }else{
                return _recommendModel.height.floatValue;
            }
            
            break;
        case FinanceCalendarSection:
            return [YZTNewsRecommendFinanceCalendarCell cellHeight:_financeCalendarModel];
            break;
        default:
            return 0;
            break;
    }
  
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YZTNewsRecommendHeaderFooterView *topHeaderView = [[YZTNewsRecommendHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 44) isFooter:NO];
    topHeaderView.nameLabel.text = @[@"最新的个人动态",@"您必须知道的今日早报",@"您可能会感兴趣的话题",@"值得您一读的热点分析",@"财经动态",@"今日运势",@"最新财经日历"][section];
    return topHeaderView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    YZTNewsRecommendHeaderFooterView *footerView = nil;
    if (section == InterestTopicSection ||section == HotSpotAnalysisSection || section == FinanceCalendarSection) {
        YZTNewsRecommendHeaderFooterView *tmpFooterView = [[YZTNewsRecommendHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 44) isFooter:YES];
        tmpFooterView.nameLabel.text = @"更多";
        footerView = tmpFooterView;
    }
    return footerView;
    
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

                
                return cell;
                
            }else{
                
                YZTNewsRecommendNoLoginShowCell *cell = [tableView dequeueReusableCellWithIdentifier:NoLoginShowCellIdentifier];
                

                return cell;
                
            }
            

            break;
            
        case TodayEarlyNewsSection:
        {
            YZTNewsRecommendTodayEarlyNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:TodayEarlyNewsCellIdentifier];
            
      
           
            [cell setRightUtilityButtons:[self rightButtons] WithButtonWidth:58.0f];
            cell.delegate = self;
       
        return cell;
        }
            break;
        case InterestTopicSection:
        {
            YZTNewsRecommendInterestTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:InterestTopicCellIdentifier];
            
       ///临时写法
            if ([self cellIsSelected:indexPath]) {
                cell.topicBottomView.hidden = NO;
            }else{
                cell.topicBottomView.hidden = YES;
            }
            WS(weakSelf);
            
            [cell setClickChangeBlock:^(id sender, TopicClickEventType clickEventType){
                
                [weakSelf handleCallbackEvents:sender topicClickEventType:clickEventType];
                
            }];
            return cell;

        }
            break;
        case HotSpotAnalysisSection:
        {
            YZTNewsRecommendHotSpotAnalysisCell *cell = [tableView dequeueReusableCellWithIdentifier:HotSpotAnalysisCellIdentifier];
            
     
            
            return cell;
        
        }
            break;
        case FinanceDynamicSection:
        {
            
            YZTNewsRecommendFinanceDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:FinanceDynamicCellIdentifier];
            
            cell.delegate = self;
            cell.line01.hidden = indexPath.row == 0;
            [cell updateWithModel:_financeDynamicModel];
            
            return cell;

        }
            break;
        case TodayFortuneSection:
        {
//            YZTNewsRecommendTodayFortuneCell *cell = [tableView dequeueReusableCellWithIdentifier:TodayFortuneCellIdentifier];
//            
//

//            return cell;
            YZTNewsRecommendWebViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WebViewCellIdentifier];
            //预先加载url
            cell.model = _recommendModel;
            [cell setWebViewFinishBlock:^(id object){
            
                NSIndexPath *selectIndexPath = [self.tableView indexPathForCell:object];
                [self.tableView reloadRowsAtIndexPaths:@[selectIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

            
            }];
            return cell;

            
        }
            break;
        case FinanceCalendarSection:
        {
            YZTNewsRecommendFinanceCalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:FinanceCalendarCellIdentifier];

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

-(void)handleCallbackEvents:(id) object topicClickEventType:(TopicClickEventType) clickEventType
{
    switch (clickEventType) {
        case LikeClickEvent:
            
            break;
        case NoLikeClickEvent:
            
            break;
        case MoreClickEvent:
        {
            NSIndexPath *selectIndexPath = [self.tableView indexPathForCell:object];
            BOOL isSelected = ![self cellIsSelected:selectIndexPath];
            NSNumber *selectIndex = [NSNumber numberWithBool:isSelected];
            [self.selectedIndexes setObject:selectIndex forKey:selectIndexPath];
            [self.tableView reloadRowsAtIndexPaths:@[selectIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }

            break;
        default:
            break;
    }
   


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

//
//  ViewController.m
//  RSDsegmentViewDemo
//
//  Created by ios on 2017/6/20.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "ViewController.h"
#import "RSDsegmentView.h"

#define screenW  self.view.bounds.size.width
#define screenH  self.view.bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
{
    RSDsegmentView *_segemtV;
}
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITableView *tableView1;
@property (nonatomic,strong) UITableView *tableView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.frame = CGRectMake(0, 64, screenW, screenH);
    self.view.backgroundColor = [UIColor grayColor];
    
    //初始化
    _segemtV = [[RSDsegmentView alloc] initWithFrame:CGRectMake(0, 5, screenW, 50)];
    //初始化一个标题
    _segemtV.titles = @[@"分类",@"我的"];
    //定义按钮和线的颜色
    _segemtV.itemColor = [UIColor blueColor];
    //按钮点击时间
    __weak typeof(self) weakSelf = self;
    _segemtV.clickBlock = ^(NSInteger index) {
        NSLog(@"---%ld---",(long)index);
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        [UIView animateWithDuration:0.5 animations:^{
            strongSelf.scrollView.contentOffset = CGPointMake(index*screenW,0);
        }];
    };
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 54, screenW, screenH - 64)];
    [_scrollView addSubview:self.tableView1];
    [_scrollView addSubview:self.tableView2];
    _scrollView.contentSize = CGSizeMake(2*screenW, screenH -64);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    
    [self.view addSubview:_scrollView];
    [self.view addSubview:_segemtV];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _segemtV.selectedIndex = scrollView.contentOffset.x / screenW;
}

-(UITableView *)tableView1
{
    if (!_tableView1) {
        _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 2, screenW, screenH-64)];
        _tableView1.backgroundColor = [UIColor orangeColor];
    }
    return _tableView1;
}

-(UITableView *)tableView2
{
    if (!_tableView2) {
        _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(screenW, 2, screenW, screenH-64)];
        _tableView2.backgroundColor = [UIColor colorWithRed:113/255.0 green:11/255.0 blue:233/255.0 alpha:1];
    }
    return _tableView2;
}

@end

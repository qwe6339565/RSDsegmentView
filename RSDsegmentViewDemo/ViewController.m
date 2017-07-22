//
//  ViewController.m
//  RSDsegmentViewDemo
//
//  Created by ios on 2017/6/20.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "ViewController.h"
#import "RSDsegmentView.h"

#define screenW  [UIScreen mainScreen].bounds.size.width
#define screenH  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
{
    RSDsegmentView *_segemtV;
}

@property (nonatomic,strong) UIScrollView *scrollView;
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
    NSArray* titles = @[@"分类1",@"我的2",@"分类3",@"我的4",@"分类5",@"我的6",@"分类7",@"我的8",@"分类9",@"我的10",@"分类11",@"我的12",];
    _segemtV.titles = titles;
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
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 54, screenW, screenH - 54)];
    _scrollView.contentSize = CGSizeMake(titles.count*screenW, screenH -64);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    for (int i = 0 ; i < titles.count; i++) {
        UITableView *tb = [[UITableView alloc] initWithFrame:CGRectMake(i*screenW, 0, screenW, screenH)];
        tb.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0f];;
        [_scrollView addSubview:tb];
    }
    
    [self.view addSubview:_scrollView];
    [self.view addSubview:_segemtV];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _segemtV.selectedIndex = scrollView.contentOffset.x / screenW;
}

@end

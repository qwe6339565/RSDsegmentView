//
//  RSDsegmentView.m
//  demo
//
//  Created by ios on 2017/6/19.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "RSDsegmentView.h"

#define kBtnTopMargin 5
#define kBtnHeight 2

@interface RSDsegmentView()
{
    UIButton *_tempBtn;
    UIView *_line;
    NSMutableArray *_btnArray;
}

@end

@implementation RSDsegmentView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self initData];
       
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

-(void)initData
{
    _titles = [[NSArray alloc] init];
    _btnArray = [NSMutableArray array];
    _selectedIndex = 0;
    _itemColor = [UIColor redColor];
    
    self.backgroundColor = [UIColor whiteColor];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self initViews];
}
#pragma mark 布局按钮和line
-(void)initViews
{

    if(_titles.count == 0) return;
    NSInteger count = _titles.count;
    CGFloat w = self.frame.size.width/count;
    
    for (int i = 0; i < count; i++)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(w*i, kBtnTopMargin, w, self.frame.size.height-kBtnHeight)];
        //初始化第一个按钮为选中状态
        if(i==0) btn.selected = YES;
        [btn setTitle:_titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:_itemColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btnArray addObject:btn];
        [self addSubview:btn];
    }
    
    _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-kBtnHeight, w, kBtnHeight)];
    _line.backgroundColor = _itemColor;
    [self addSubview:_line];
    
}

-(void)btnClick:(UIButton *)btn
{
    self.selectedIndex = [_btnArray indexOfObject:btn];
    if(self.clickBlock) self.clickBlock(_selectedIndex);
}

-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    if(selectedIndex>=_btnArray.count) return;
    UIButton *btn = [_btnArray objectAtIndex:selectedIndex];
    //改按钮状态
    [_btnArray enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       if(idx == selectedIndex)
       {
           obj.selected = YES;
       }
       else
       {
           obj.selected = NO;
       }
    }];
    //移动线
    CGFloat lineX = btn.frame.origin.x;
    CGFloat lineY = _line.frame.origin.y;
    CGFloat lineW = _line.frame.size.width;
    CGFloat lineH = _line.frame.size.height;
    [UIView animateWithDuration:0.5 animations:^{
        _line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    }];

}

@end

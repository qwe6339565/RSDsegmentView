//
//  RSDsegmentView.h
//  demo
//
//  Created by ios on 2017/6/19.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnClickBlock)(NSInteger index);

@interface RSDsegmentView : UIView
//按钮标题数组
@property (nonatomic,copy) NSArray *titles;
//当前选中的按钮索引
@property (nonatomic,assign) NSInteger selectedIndex;
//按钮点击block
@property (nonatomic,copy) btnClickBlock clickBlock;
//按钮和line颜色
@property (nonatomic,strong) UIColor *itemColor;

@end

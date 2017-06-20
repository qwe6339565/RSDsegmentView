# RSDsegmentView
这是一个segmentView，一般用来切换scrollview使用

使用很容易如下：

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

详见demo

//
//  DailyView.m
//  TestDaily
//
//  Created by Yana on 15/10/27.
//  Copyright (c) 2015年 Yana. All rights reserved.
//

#import "DailyView.h"


@interface DailyView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *myArr;
@end


@implementation DailyView
-(id)initWithFrame:(CGRect)frame array:(NSArray *)titleArray {
    self = [super initWithFrame:frame];
    if (self) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(runTimer:) userInfo:titleArray repeats:YES];
        self.myArr=[NSArray arrayWithArray:titleArray];
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height *titleArray.count);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.contentOffset = CGPointMake(0, frame.size.height);
        [self addSubview:_scrollView];
        
        /*
        UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, frame.size.width / 5.0, frame.size.height - 6)];
        aLabel.text = @"头条资讯";
        aLabel.textColor = [UIColor redColor];
        aLabel.layer.borderWidth = 1.0;
        aLabel.layer.borderColor = [[UIColor redColor] CGColor];
        aLabel.font = [UIFont systemFontOfSize:15.0];
        aLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:aLabel];
        */
         
        
        for (int i = 0; i < titleArray.count; i++) {
            _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height * i,frame.size.width, frame.size.height)];
            _titleLabel.text = titleArray[i];
            _titleLabel.textColor = [UIColor blackColor];
            _titleLabel.font = [UIFont systemFontOfSize:15.0];
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            [_scrollView addSubview:_titleLabel];
        }
    }
    return self;
}
- (void)runTimer:(NSTimer *)timer {
    NSArray *arr = [timer userInfo]; //获取数组
    CGFloat y = _scrollView.contentOffset.y;
    NSInteger index = _scrollView.contentOffset.y / _scrollView.frame.size.height;
    if (arr.count - 2 == index) {
        [_scrollView setContentOffset:CGPointMake(0,_scrollView.frame.size.height * (arr.count - 1)) animated:YES];
        [self performSelector:@selector(moveScorller) withObject:nil afterDelay:1.0];
    } else {
        [_scrollView setContentOffset:CGPointMake(0, y + _scrollView.frame.size.height) animated:YES];
    }
}
- (void)moveScorller{
    [_scrollView setContentOffset:CGPointMake(0, _scrollView.frame.size.height) animated:NO];
}
@end

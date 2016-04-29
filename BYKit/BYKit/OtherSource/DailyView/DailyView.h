//
//  DailyView.h
//  TestDaily
//
//  Created by Yana on 15/10/27.
//  Copyright (c) 2015年 Yana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyView : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) NSTimer *timer;


-(id)initWithFrame:(CGRect)frame array:(NSArray *)titleArray;
@end

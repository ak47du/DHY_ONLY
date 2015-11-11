//
//  XLHeaderBtnsView.m
//  XL情理攻略
//
//  Created by qianfeng on 15/11/10.
//  Copyright © 2015年 qiling. All rights reserved.
//

#import "XLHeaderBtnsView.h"

@interface XLHeaderBtnsView ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *btnArrayM;
@property (nonatomic) UIView *lineView;
@end

@implementation XLHeaderBtnsView

+(id)headerBtnsView
{
    return [[self alloc]init];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor colorWithRed:252 green:211 blue:225 alpha:1]];
    }
    return self;
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    _btnArrayM = [[NSMutableArray alloc]init];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width-40, self.frame.size.height)];
    [_scrollView setBackgroundColor:[UIColor colorWithRed:252 green:211 blue:225 alpha:1]];
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    double x = 0;
    
    for (int i=0; i<_btnsArray.count; i++) {
        UIFont *font = [UIFont systemFontOfSize:12];
        CGSize size = [_btnsArray[i] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
        double width = size.width;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(x, 0, width, 29)];
        [btn setTitle:_btnsArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [_scrollView addSubview:btn];
        [_btnArrayM addObject:btn];
        
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = [UIColor redColor];
        [_scrollView addSubview:_lineView];
        
        x+=width+10;
    }
    _scrollView.contentSize = CGSizeMake(x, 30);
}
-(void)btnClicked:(UIButton *)btn
{
    UIButton *b = _btnArrayM[btn.tag];
    CGRect rect = b.frame;
    [UIView animateWithDuration:0.3 animations:^{
        [_lineView setFrame:CGRectMake(rect.origin.x, 29, rect.size.width, 1)];
    }];
}

@end

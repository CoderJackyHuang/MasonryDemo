//
//  AspectFitController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "AspectFitController.h"

@implementation AspectFitController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Create views
  UIView *topView = [[UIView alloc] init];
  topView.backgroundColor = [UIColor redColor];
  [self.view addSubview:topView];
  
  UIView *topInnerView = [[UIView alloc] init];
  topInnerView.backgroundColor = [UIColor greenColor];
  [topView addSubview:topInnerView];
  
  UIView *bottomView = [[UIView alloc] init];
  bottomView.backgroundColor = [UIColor blackColor];
  [self.view addSubview:bottomView];
  
  UIView *bottomInnerView = [[UIView alloc] init];
  bottomInnerView.backgroundColor = [UIColor blueColor];
  [bottomView addSubview:bottomInnerView];
  
  [topView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.top.mas_equalTo(0);
    make.height.mas_equalTo(bottomView);
  }];
  
  // width = height / 3
  [topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.mas_equalTo(topView);
    make.width.mas_equalTo(topInnerView.mas_height).multipliedBy(3);
    make.center.mas_equalTo(topView);
    
    // 设置优先级
    make.width.height.mas_equalTo(topView).priorityLow();
    make.width.height.lessThanOrEqualTo(topView);
  }];
  
  [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.bottom.mas_equalTo(0);
    make.height.mas_equalTo(topView);
    make.top.mas_equalTo(topView.mas_bottom);
  }];
  
  // width/height比为1/3.0，要求是同一个控件的属性比例
  [bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.bottom.mas_equalTo(bottomView);
    make.center.mas_equalTo(bottomView);
    // 注意，这个multipliedBy的使用只能是设置同一个控件的，比如这里的bottomInnerView，
    // 设置高/宽为3:1
    make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
    
    make.width.height.mas_equalTo(bottomView).priorityLow();
    make.width.height.lessThanOrEqualTo(bottomView);
  }];
}

@end

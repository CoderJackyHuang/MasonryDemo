//
//  UpdateConstraintsController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "UpdateConstraintsController.h"

@interface UpdateConstraintsController ()

@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGFloat scacle;

@end

@implementation UpdateConstraintsController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  [self configUI];
  return;
  
  self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [self.growingButton setTitle:@"点我放大" forState:UIControlStateNormal];
  self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
  self.growingButton.layer.borderWidth = 3;
  
  [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.growingButton];
  self.scacle = 1.0;
  
  [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(self.view);
    
    // 初始宽、高为100，优先级最低
    make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
    // 最大放大到整个view
    make.width.height.lessThanOrEqualTo(self.view);
  }];
}

#pragma mark - updateViewConstraints
- (void)updateViewConstraints {
  [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(self.view);
    
    // 初始宽、高为100，优先级最低
    make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
    // 最大放大到整个view
    make.width.height.lessThanOrEqualTo(self.view);
  }];
  
  [super updateViewConstraints];
}

- (void)onGrowButtonTaped:(UIButton *)sender {
  self.scacle += 0.2;
  
  // 告诉self.view约束需要更新
  [self.view setNeedsUpdateConstraints];
  // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
  [self.view updateConstraintsIfNeeded];
  
  [UIView animateWithDuration:0.3 animations:^{
    [self.view layoutIfNeeded];
  }];
}

- (void)configUI {
  UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
  [btn1 setTitle:@"按钮1" forState:UIControlStateNormal];
  btn1.layer.borderColor = UIColor.greenColor.CGColor;
  btn1.layer.borderWidth = 3;
  [self.view addSubview:btn1];
  
  
  UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
  [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
  btn2.layer.borderColor = UIColor.greenColor.CGColor;
  btn2.layer.borderWidth = 3;
  [self.view addSubview:btn2];
  
  UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
  [btn3 setTitle:@"按钮3" forState:UIControlStateNormal];
  btn3.layer.borderColor = UIColor.greenColor.CGColor;
  btn3.layer.borderWidth = 3;
  [self.view addSubview:btn3];
  
//  [@[btn1, btn2, btn3] mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.left.mas_equalTo(15);
//    make.right.mas_equalTo(-15);
//    make.height.mas_equalTo(45);
//  }];
//  
//  [btn1 mas_updateConstraints:^(MASConstraintMaker *make) {
//    make.top.mas_equalTo(100);
//  }];
//  
//  [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.top.mas_equalTo(btn1.mas_bottom).offset(40);
//  }];
//  
//  [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.top.mas_equalTo(btn2.mas_bottom).offset(40);
//  }];
//
//  [@[btn1, btn2, btn3] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
//                                   withFixedSpacing:40
//                                        leadSpacing:15
//                                        tailSpacing:15];
  [@[btn1, btn2, btn3] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedItemLength:80
                                        leadSpacing:15
                                        tailSpacing:15];

  [@[btn1, btn2, btn3] mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(100);
  }];
  
//    [@[btn1, btn2, btn3] mas_distributeViewsAlongAxis:MASAxisTypeVertical
//                                     withFixedSpacing:40
//                                          leadSpacing:15
//                                          tailSpacing:15];
//
}

@end

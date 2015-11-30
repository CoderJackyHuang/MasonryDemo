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

@end

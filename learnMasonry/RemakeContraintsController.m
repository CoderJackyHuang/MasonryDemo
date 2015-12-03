//
//  RemakeContraintsController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "RemakeContraintsController.h"

@interface RemakeContraintsController ()

@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, strong) MASConstraint *height;

@end

@implementation RemakeContraintsController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
  self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
  self.growingButton.layer.borderWidth = 3;
  self.growingButton.backgroundColor = [UIColor redColor];
  [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.growingButton];
  self.isExpanded = NO;
}

- (void)updateViewConstraints {
  // 这里使用update也是一样的。
  // remake会将之前的全部移除，然后重新添加
  __weak __typeof(self) weakSelf = self;
  [self.growingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(0);
    make.left.right.mas_equalTo(0);
    if (weakSelf.isExpanded) {
      make.bottom.mas_equalTo(0);
    } else {
      make.bottom.mas_equalTo(-350);
    }
  }];
  
  [super updateViewConstraints];
}

- (void)onGrowButtonTaped:(UIButton *)sender {
  self.isExpanded = !self.isExpanded;
  if (!self.isExpanded) {
    [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
  } else {
    [self.growingButton setTitle:@"点我收起" forState:UIControlStateNormal];
  }
  
  // 告诉self.view约束需要更新
  [self.view setNeedsUpdateConstraints];
  // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
  [self.view updateConstraintsIfNeeded];
  
  [UIView animateWithDuration:0.3 animations:^{
    [self.view layoutIfNeeded];
  }];
}

@end

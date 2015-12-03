//
//  BasicController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "BasicController.h"

@implementation BasicController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIView *greenView = UIView.new;
  greenView.backgroundColor = UIColor.greenColor;
  greenView.layer.borderColor = UIColor.blackColor.CGColor;
  greenView.layer.borderWidth = 2;
  [self.view addSubview:greenView];
  
  UIView *redView = UIView.new;
  redView.backgroundColor = UIColor.redColor;
  redView.layer.borderColor = UIColor.blackColor.CGColor;
  redView.layer.borderWidth = 2;
  [self.view addSubview:redView];
  
  UIView *blueView = UIView.new;
  blueView.backgroundColor = UIColor.blueColor;
  blueView.layer.borderColor = UIColor.blackColor.CGColor;
  blueView.layer.borderWidth = 2;
  [self.view addSubview:blueView];
  
  // 使这三个控件等高
  CGFloat padding = 10;
  [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(padding);
    make.right.mas_equalTo(redView.mas_left).offset(-padding);
    make.bottom.mas_equalTo(blueView.mas_top).offset(-padding);
    // 三个控件等高
    make.height.mas_equalTo(@[redView, blueView]);
    // 红、绿这两个控件等高
    make.width.mas_equalTo(redView);
  }];
  
  [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.height.bottom.mas_equalTo(greenView);
    make.right.mas_equalTo(-padding);
    make.left.mas_equalTo(greenView.mas_right).offset(padding);
  }];
  
  [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.height.mas_equalTo(greenView);
    make.bottom.mas_equalTo(-padding);
    make.left.mas_equalTo(padding);
    make.right.mas_equalTo(-padding);
  }];
}

@end

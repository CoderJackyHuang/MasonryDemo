//
//  HYBBaseController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "HYBBaseController.h"

@implementation HYBBaseController

- (instancetype)initWithTitle:(NSString *)title {
  if (self = [super init]) {
    self.title = title;
  }
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  if (kIOSVersion >= 7.0) {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
  }
  
  self.view.backgroundColor = [UIColor whiteColor];
}

@end

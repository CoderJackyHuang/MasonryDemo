//
//  HeaderFooterViewController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/30.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "HeaderFooterViewController.h"

@interface HeaderFooterViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HeaderFooterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self configTableView];
}

- (void)configScrollView {
  self.scrollView = [[UIScrollView alloc] init];
  [self.view addSubview:self.scrollView];
  [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(self.view);
  }];
  
  UIView *headerView = [[UIView alloc] init];
  [self.scrollView addSubview:headerView];
  
  UIImageView *imgView = [[UIImageView alloc] init];
  [headerView addSubview:imgView];
  imgView.backgroundColor = [UIColor greenColor];
  imgView.layer.cornerRadius = 50;
  imgView.layer.masksToBounds = YES;
  imgView.layer.borderWidth = 0.5;
  imgView.layer.borderColor = [UIColor redColor].CGColor;
  
  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
  
  UILabel *tipLabel = [[UILabel alloc] init];
  tipLabel.text = @"这里是提示信息，通常会比较长，可能会超过两行。为了适配6.0，我们需要指定preferredMaxLayoutWidth，但是要注意，此属性一旦设置，不是只在6.0上生效，任意版本的系统的都有作用，因此此值设置得一定要准备，否则计算结果会不正确。我们一定要注意，不能给tableview的tableHeaderView和tableFooterView添加约束，在6.0及其以下版本上会crash，其它版本没有";
  tipLabel.textAlignment = NSTextAlignmentCenter;
  tipLabel.textColor = [UIColor blackColor];
  tipLabel.backgroundColor = [UIColor clearColor];
  tipLabel.numberOfLines = 0;
  tipLabel.preferredMaxLayoutWidth = screenWidth - 30;
  [headerView addSubview:tipLabel];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:@"Show detail" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [button setBackgroundColor:[UIColor blueColor]];
  button.layer.cornerRadius = 6;
  button.clipsToBounds = YES;
  button.layer.masksToBounds = YES;
  
  [headerView addSubview:button];
  
  [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.top.mas_equalTo(0);
    make.width.mas_equalTo(self.view);
    make.bottom.mas_equalTo(button.mas_bottom).offset(60).priorityLow();
    make.height.greaterThanOrEqualTo(self.view);
  }];
  
  [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(80);
    make.centerX.mas_equalTo(headerView);
    make.width.height.mas_equalTo(100);
  }];
  
  [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(15);
    make.right.mas_equalTo(-15);
    make.top.mas_equalTo(imgView.mas_bottom).offset(40);
  }];
  [button mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_greaterThanOrEqualTo(tipLabel.mas_bottom).offset(80);
    make.left.mas_equalTo(15);
    make.right.mas_equalTo(-15);
    make.height.mas_equalTo(45);
  }];
  
  [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
    make.bottom.mas_equalTo(button.mas_bottom).offset(80).priorityLow();
    make.bottom.mas_greaterThanOrEqualTo(self.view);
  }];
}

- (void)configTableView {
  if (self.tableView != nil) {
    return;
  }
  self.tableView = [[UITableView alloc] init];
  [self.view addSubview:self.tableView];
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(self.view);
  }];
  
  NSArray *array = [self headerViewWithHeight:self.view.frame.size.height addToView:self.view];
    UIView *headerView = [array firstObject];
  [headerView layoutIfNeeded];
  UIButton *button = [array lastObject];
  CGFloat h = button.frame.size.height + button.frame.origin.y + 40;
  h = h < self.view.frame.size.height ? self.view.frame.size.height : h;
  
  [headerView removeFromSuperview];
  [self headerViewWithHeight:h addToView:nil];
}

- (NSArray *)headerViewWithHeight:(CGFloat)height addToView:(UIView *)toView {
  // 注意，绝对不能给tableheaderview直接添加约束，必闪退
  UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
  
  if (toView) {
    [toView addSubview:headerView];
  } else {
    self.tableView.tableHeaderView = headerView;
  }
  
  UIImageView *imgView = [[UIImageView alloc] init];
  [headerView addSubview:imgView];
  imgView.backgroundColor = [UIColor greenColor];
  imgView.layer.cornerRadius = 50;
  imgView.layer.masksToBounds = YES;
  imgView.layer.borderWidth = 0.5;
  imgView.layer.borderColor = [UIColor redColor].CGColor;
  
  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
  
  UILabel *tipLabel = [[UILabel alloc] init];
  tipLabel.text = @"这里是提示信息，通常会比较长，可能会超过两行。为了适配6.0，我们需要指定preferredMaxLayoutWidth，但是要注意，此属性一旦设置，不是只在6.0上生效，任意版本的系统的都有作用，因此此值设置得一定要准备，否则计算结果会不正确。我们一定要注意，不能给tableview的tableHeaderView和tableFooterView添加约束，在6.0及其以下版本上会crash，其它版本没有";
  tipLabel.textAlignment = NSTextAlignmentCenter;
  tipLabel.textColor = [UIColor blackColor];
  tipLabel.backgroundColor = [UIColor clearColor];
  tipLabel.numberOfLines = 0;
  tipLabel.preferredMaxLayoutWidth = screenWidth - 30;
  [headerView addSubview:tipLabel];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:@"Show detail" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [button setBackgroundColor:[UIColor blueColor]];
  button.layer.cornerRadius = 6;
  button.clipsToBounds = YES;
  button.layer.masksToBounds = YES;
  
  [headerView addSubview:button];
  
  [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(80);
    make.centerX.mas_equalTo(headerView);
    make.width.height.mas_equalTo(100);
  }];
  
  [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(self.view).offset(15);
    make.right.mas_equalTo(self.view).offset(-15);
    make.top.mas_equalTo(imgView.mas_bottom).offset(40);
  }];
  
  [button mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_greaterThanOrEqualTo(tipLabel.mas_bottom).offset(80);
    make.left.mas_equalTo(tipLabel);
    make.right.mas_equalTo(tipLabel);
    make.height.mas_equalTo(45);
  }];
  
  return @[headerView, button];
}

@end

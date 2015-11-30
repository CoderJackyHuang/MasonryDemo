//
//  ViewController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "BasicController.h"
#import "UpdateConstraintsController.h"
#import "RemakeContraintsController.h"
#import "TotalUpdateController.h"
#import "CompositeController.h"
#import "AspectFitController.h"
#import "BasicAnimatedController.h"
#import "ScrollViewController.h"
#import "ScrollViewComplexController.h"
#import "TableViewController.h"
#import "HeaderFooterViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.tableView = [[UITableView alloc] init];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(self.view);
  }];

  self.controllers = @[
                       [[BasicController alloc] initWithTitle:@"基础使用"],
                       [[UpdateConstraintsController alloc] initWithTitle:@"动画更新约束"],
                       [[RemakeContraintsController alloc] initWithTitle:@"动画重新添加约束"],
                       [[TotalUpdateController alloc] initWithTitle:@"整体动画更新约束"],
                       [[CompositeController alloc] initWithTitle:@"复合view循环约束"],
                       [[AspectFitController alloc] initWithTitle:@"约束百分比"],
                       [[BasicAnimatedController alloc] initWithTitle:@"基本动画"],
                       [[ScrollViewController alloc] initWithTitle:@"ScrollView布局"],
                       [[ScrollViewComplexController alloc] initWithTitle:@"复杂ScrollView"],
                       [[TableViewController alloc] initWithTitle:@"tableview布局"],
                       [[HeaderFooterViewController alloc] initWithTitle:@"header/footer layout"],
                       ];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *kCellIdentifier = @"CellIdentifier";
  UIViewController *viewController = self.controllers[indexPath.row];
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
  
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
  }
  
  cell.textLabel.text = viewController.title;
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.controllers.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UIViewController *viewController = self.controllers[indexPath.row];
  [self.navigationController pushViewController:viewController animated:YES];
}

@end

//
//  TableViewController.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/28.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "TableViewController.h"
#import "TestCell.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.tableView = [[UITableView alloc] init];
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(self.view);
  }];
  
  for (NSUInteger i = 0; i < 10; ++i) {
    TestModel *model = [[TestModel alloc] init];
    model.title = @"测试标题，可能很长很长，反正随便写着先吧！";
    model.desc = @"描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，";
    
    [self.dataSource addObject:model];
  }
  
  [self.tableView reloadData];
}

- (NSMutableArray *)dataSource {
  if (_dataSource == nil) {
    _dataSource = [[NSMutableArray alloc] init];
  }
  
  return _dataSource;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"CellIdentifier";

  TestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (!cell) {
    cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  cell.indexPath = indexPath;
  cell.block = ^(NSIndexPath *path) {
    [tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
  };
  TestModel *model = [self.dataSource objectAtIndex:indexPath.row];
  [cell configCellWithModel:model];
  
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  TestModel *model = [self.dataSource objectAtIndex:indexPath.row];
  
  return [TestCell heightWithModel:model];
}


@end

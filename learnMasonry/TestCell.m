//
//  TestCell.m
//  learnMasonry
//
//  Created by huangyibiao on 15/11/28.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "TestCell.h"
#import "Masonry.h"

@interface TestCell ()

@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) TestModel *model;

@end

@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.backgroundColor = [UIColor greenColor];
    imgView.layer.cornerRadius = 35;
    imgView.layer.borderColor = [UIColor redColor].CGColor;
    imgView.layer.borderWidth = 1.0;
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(15);
      make.size.mas_equalTo(CGSizeMake(70, 70));
      make.top.mas_equalTo(15);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    // 兼容6.0
    self.titleLabel.preferredMaxLayoutWidth = w - 100 - 15;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(imgView.mas_right).offset(15);
      make.right.mas_equalTo(self.contentView).offset(-15);
      make.top.mas_equalTo(imgView);
    }];
    
    self.descLabel = [[UILabel alloc] init];
    self.descLabel.textColor = [UIColor blackColor];
    self.descLabel.font = [UIFont systemFontOfSize:13];
    self.descLabel.numberOfLines = 0;
    self.descLabel.textAlignment = NSTextAlignmentLeft;
    // 兼容6.0
    self.descLabel.preferredMaxLayoutWidth = w - 100 - 15;
    [self.contentView addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(imgView.mas_right).offset(15);
      make.right.mas_equalTo(self.contentView).offset(-15);
      make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
    }];
    self.descLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    [self.descLabel addGestureRecognizer:tap];
    
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineLabel];
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.descLabel.mas_bottom).offset(19.5);
      make.left.mas_equalTo(15);
      make.right.mas_equalTo(0);
      make.height.mas_equalTo(0.5);
    }];
    self.lineLabel = lineLabel;
  }
  
  return self;
}

- (void)configCellWithModel:(TestModel *)model {
  self.model = model;
  self.titleLabel.text = model.title;
  self.descLabel.text = model.desc;
  
  if (model.isExpanded) {
    [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(self.titleLabel);
      make.right.mas_equalTo(self.titleLabel);
      make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
    }];
  } else {
    [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(self.titleLabel);
      make.right.mas_equalTo(self.titleLabel);
      make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
      make.height.mas_equalTo(40);
    }];
  }
}

- (void)onTap {
  self.model.isExpanded = !self.model.isExpanded;

  if (self.block) {
    self.block(self.indexPath);
  }
  
  [self configCellWithModel:self.model];
  [self.contentView setNeedsUpdateConstraints];
  [self.contentView updateConstraintsIfNeeded];
  
  [UIView animateWithDuration:0.15 animations:^{
    [self.contentView layoutIfNeeded];
  }];
}

+ (CGFloat)heightWithModel:(TestModel *)model {
  TestCell *cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
  [cell configCellWithModel:model];
  
  [cell layoutIfNeeded];
  
  CGRect frame =  cell.descLabel.frame;
  return frame.origin.y + frame.size.height + 20;
}

@end

@implementation TestModel


@end

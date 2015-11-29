//
//  HYBBaseController.h
//  learnMasonry
//
//  Created by huangyibiao on 15/11/27.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

#define kWeakObject(obj) __weak __typeof(obj) weakObject = obj;
#define kIOSVersion ((float)[[[UIDevice currentDevice] systemVersion] doubleValue])

@interface HYBBaseController : UIViewController

- (instancetype)initWithTitle:(NSString *)title;

@end

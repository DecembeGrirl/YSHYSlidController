//
//  LeftController.h
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/30.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuController : UIViewController
@property (nonatomic, strong) UITableView * tableMenu;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, copy)NSIndexPath  *currentIndex;
@end

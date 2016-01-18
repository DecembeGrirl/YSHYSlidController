//
//  BaseController.m
//  WumartLehui
//
//  Created by 杨淑园 on 15/8/12.
//  Copyright (c) 2015年 yangshuyuan. All rights reserved.
//

#import "BaseController.h"
#import "YSHYSlideViewController.h"
@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.customNav = [[CustomNavbar alloc] initWithFrame:CGRectMake(0, 0, [CustomNavbar barWidth], [CustomNavbar barHeight])];
    self.customNav.VC = self;
    [self.view addSubview:self.customNav];
    
   
}




@end

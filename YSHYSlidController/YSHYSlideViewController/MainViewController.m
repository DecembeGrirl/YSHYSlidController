//
//  TestViewController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/11/3.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "MainViewController.h"
#import "YSHYSlideViewController.h"
#import "OtherViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNav.hidden = NO;
    [self.customNav setNavTitle:@"主页面"];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [self.customNav setLeftNavButton:leftBtn];
    
    
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [Btn setFrame:CGRectMake(100, 150, 50, 40)];
    [Btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:Btn];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[YSHYSlideViewController shareInstance] addGesture];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[YSHYSlideViewController shareInstance] removeAllGesture];
}

-(void)leftBtnClick:(UIButton *)button
{
    [[YSHYSlideViewController shareInstance]SwitchMenuState];
}

-(void)BtnClick:(UIButton *)button
{
    OtherViewController * VC = [[OtherViewController alloc]init];
    [VC.view setBackgroundColor:[UIColor redColor]];
    [self.navigationController pushViewController:VC animated:YES];

}


@end

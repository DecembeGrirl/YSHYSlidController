//
//  LeftController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/30.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "LeftMenuController.h"
#import "YSHYSlideViewController.h"
#import "OtherViewController.h"

#define cellHeight   50

@interface LeftMenuController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view  setBackgroundColor:[UIColor whiteColor]];
    
    
    //菜单选项
    self.tableMenu  = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 200, self.view.frame.size.height)];
    self.tableMenu.delegate = self;
    self.tableMenu.dataSource = self;
    self.currentIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.view addSubview:self.tableMenu];
    
    //覆盖层  选中菜单 回到页面时出现的菜单变暗的效果
    self.coverView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.coverView setBackgroundColor:[UIColor blackColor]];
    self.coverView.alpha = 0.5;
    [self.view addSubview:self.coverView];
    
}


#pragma  maek - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger row = 4;
    CGRect frame  = tableView.frame;
   frame.size.height = cellHeight *row;
    tableView.frame = frame;
    return row;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个Controller",(long)indexPath.row];
    return  cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0)
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"第0个controller"];
        [VC.view setBackgroundColor:[UIColor purpleColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else if(indexPath.row == 1)
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"第1个controller"];
        [VC.view setBackgroundColor:[UIColor blueColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else if ( indexPath.row == 2)
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"第2个controller"];
        [VC.view setBackgroundColor:[UIColor yellowColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"第3个controller"];
        [VC.view setBackgroundColor:[UIColor greenColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  cellHeight;
}




@end

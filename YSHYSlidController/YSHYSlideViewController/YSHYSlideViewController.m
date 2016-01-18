//
//  MainViewController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/29.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "YSHYSlideViewController.h"
#import "LeftMenuController.h"
static YSHYSlideViewController *signletonInstance;

@interface YSHYSlideViewController ()

@end

@implementation YSHYSlideViewController

+(YSHYSlideViewController *)shareInstance
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        signletonInstance = [[self alloc] init];
    });
    return  signletonInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationBar.hidden = YES;
    signletonInstance = self;
    self.delegate = self;
    //禁止NavigationController中的系统自带pop效果
//    self.interactivePopGestureRecognizer.enabled = NO;
    self.MenuIsOpen = NO;
    [self ConfigUI];
}
-(void)ConfigUI
{
    CGFloat widthRation = kMenuWidth/(CGFloat)kScreenWidthFor6;
    self.menuWidth = widthRation * kScreenWidth;  ;
    
    self.view.layer.shadowColor =[UIColor darkGrayColor].CGColor;
    self.view.layer.shadowOpacity = 1;
    self.view.layer.shadowRadius =10;
    self.view.layer.shouldRasterize = YES;
}
-(void)addGesture
{
    //添加手势
    UIPanGestureRecognizer * panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(PanGestureRespond:)];
    panGesture.minimumNumberOfTouches = 1;
    [self.view addGestureRecognizer:panGesture];
}

-(void)removeAllGesture
{
    for (UIGestureRecognizer * gesture in self.view.gestureRecognizers) {
        [self.view removeGestureRecognizer:gesture];
    }
}
#pragma mark - 设置
-(void)setMainViewController:(UIViewController *)ViewController
{
    [super pushViewController:ViewController animated:YES];
}

-(void)SwipGestureRespond:(UISwipeGestureRecognizer * )gesture
{
    if(gesture.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self OpenMenu];
    }
    else if(gesture.direction ==UISwipeGestureRecognizerDirectionLeft)
    {
        [self CloseMenu];
    }
}
-(void)PanGestureRespond:(UIPanGestureRecognizer *)gesture
{
    CGFloat translationX = [gesture translationInView:self.view].x;
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        UIView *coverView = self.leftMenu.view.subviews[1];
        CGFloat orignX,orignY,tempWidth,tempHeigth;
        tempWidth = self.view.frame.size.width;
        
        if(translationX > 0  )
        {
            orignX =self.view.frame.origin.x < self.menuWidth?self.view.frame.origin.x + 10: self.menuWidth;
            coverView.alpha = coverView.alpha <= 0?0:coverView.alpha - 0.02;
        }
        else
        {
            orignX = self.view.frame.origin.x  > 0 ?self.view.frame.origin.x - 10: 0;
            coverView.hidden = NO;
            coverView.alpha =coverView.alpha > 1.0?1.0f:coverView.alpha + 0.02;
        }
        orignY = orignX/ 2;
        tempHeigth = kScreenHeight - orignY*2;
        
        [UIView  animateWithDuration:0.15 animations:^{
            [self.view setFrame:CGRectMake(orignX, orignY, tempWidth, tempHeigth)];
            [self.view.window insertSubview:self.leftMenu.view atIndex:0];
        }];
        
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        if(translationX > 0 && self.view.frame.origin.x > self.menuWidth / 3)
        {
            [self OpenMenu];
        }
        else
        {
            [self CloseMenu];
        }
    }
}


#pragma mark - 跳转到选中的Controller 中
-(void)GotoViewController:(UIViewController *)viewController
{
    [self GotoRootViewController];
    [super pushViewController:viewController animated:NO];
}
-(void)GotoRootViewController
{
    [self CloseMenu];
    [super popToRootViewControllerAnimated:NO];
    [self removeAllGesture];
}

-(void)SwitchMenuState
{
    if(self.MenuIsOpen)
    {
        [self CloseMenu];
    }
    else
    {
        [self OpenMenu];
    }
}
-(void)OpenMenu
{
    self.MenuIsOpen = YES;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(self.menuWidth, self.menuWidth/2, self.view.frame.size.width, kScreenHeight- self.menuWidth)];
        [self.view.window insertSubview:self.leftMenu.view atIndex:0];
        //隐藏 半透明覆盖层
        UIView *view = self.leftMenu.view.subviews[1];
        view.alpha = 0.0f;
        view.hidden = YES;
    }];
}

-(void)CloseMenu
{
    self.MenuIsOpen = NO;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, kScreenHeight)];
        //显示 半透明覆盖层
        UIView *view = self.leftMenu.view.subviews[1];
        view.alpha = 0.5f;
        view.hidden = NO;
    } completion:nil];
}

@end

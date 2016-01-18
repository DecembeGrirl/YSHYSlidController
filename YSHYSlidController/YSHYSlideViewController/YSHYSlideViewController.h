//
//  MainViewController.h
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/29.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define  kScreenWidthFor6 375
#define  kMenuWidth 200
#define  kScreenWidth [UIScreen mainScreen].bounds.size.width
#define  kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface YSHYSlideViewController : UINavigationController<UINavigationControllerDelegate>
@property (nonatomic, assign)NSInteger menuWidth;
@property (nonatomic, strong)UIViewController *leftMenu;
@property (nonatomic, assign)BOOL MenuIsOpen;

+(YSHYSlideViewController *)shareInstance;
-(void)setMainViewController:(UIViewController *)ViewController;
-(void)GotoViewController:(UIViewController *)viewController;
-(void)GotoRootViewController;
-(void)SwitchMenuState;
-(void)addGesture;
-(void)removeAllGesture;
@end

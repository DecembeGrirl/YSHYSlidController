# YSHYSlidController
侧滑菜单
支持点击更多按钮显示/关闭菜单栏,
支持滑动显示/关闭菜单栏 
支持自定义菜单

导入
#import "LeftMenuController.h"
#import "MainViewController.h"
#import "YSHYSlideViewController.h"
在AppDelegate中进行如下配置
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //设置菜单Controller
    LeftMenuController * leftMenu = [[LeftMenuController alloc]init];
    
    [YSHYSlideViewController shareInstance].leftMenu = leftMenu;
    
    self.window.rootViewController = [YSHYSlideViewController shareInstance];
    
    //设置mainController
    MainViewController * mainController = [[MainViewController alloc]init];
    
    [[YSHYSlideViewController shareInstance] setMainViewController:mainController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
    
}

![image](https://github.com/DecembeGrirl/YSHYSlidController/blob/master/YSHYSlidController/YSHYSlideViewController/Image/YSHYSlidController.gif)

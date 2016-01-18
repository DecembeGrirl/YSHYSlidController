# YSHYSlidController

在Appdelegate中只需要简单的设置就可以实现 侧滑菜单功能

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
    {
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

    效果图
![image](https://github.com/DecembeGrirl/YSHYSlidController/blob/master/YSHYSlideViewController/Image/YSHYSlidController.gif)
    
    有任何疑问,建议或者意见 都要告诉我哦~

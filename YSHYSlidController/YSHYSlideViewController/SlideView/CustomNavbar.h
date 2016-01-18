//
//  CustomNavbar.h
//  WumartLehui
//
//  Created by 杨淑园 on 15/8/12.
//  Copyright (c) 2015年 yangshuyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB_COLOR(_STR_) ([UIColor colorWithRed:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(1, 2)] UTF8String], 0, 16)] intValue] / 255.0 green:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(3, 2)] UTF8String], 0, 16)] intValue] / 255.0 blue:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(5, 2)] UTF8String], 0, 16)] intValue] / 255.0 alpha:1.0])

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define KNAVBARHEIGHT  64

@interface CustomNavbar : UIView
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)UIViewController * VC;
@property (nonatomic, strong)UIButton *backBtn;

+ (CGFloat)barWidth;
+ (CGFloat)barHeight;

- (void)setBackBtn;
- (void)setLeftNavButton:(UIButton *)butt;
- (void)setRightNavButton:(UIButton *)butt;
- (void)setNavTitle:(NSString *)strTitle;
+ (UIButton *)createNavButtonByImageNormal:(NSString *)strNormal imageSelected:(NSString *)strSelected target:(id)target action:(SEL)action;
+ (UIButton *)createNavButttonByTitle:(NSString *)strTitle target:(id)target action:(SEL)action;
@end

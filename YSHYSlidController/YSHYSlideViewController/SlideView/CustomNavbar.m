//
//  CustomNavbar.m
//  WumartLehui
//
//  Created by 杨淑园 on 15/8/12.
//  Copyright (c) 2015年 yangshuyuan. All rights reserved.
//

#import "CustomNavbar.h"

@implementation CustomNavbar


-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self ConfigUI];
        
    }
    return  self;
    
}

-(void)ConfigUI
{
    [self setFrame:CGRectMake(0, 0, kScreenWidth, KNAVBARHEIGHT)];
    self.backgroundColor = RGB_COLOR(@"#46F3DD");
    [self setNavTitleLabel];
    [self setBackBtn];
    
    
}

+(CGSize)BarBtnSize
{
    return CGSizeMake(60.0f, 40.0f);
}

+ (CGSize)barSize
{
    return CGSizeMake(kScreenWidth, 64.0f);
}

+(CGFloat)barWidth
{
    return [[self class] barSize].width;
}

+(CGFloat)barHeight
{
    return  [[self class]barSize].height;
}

/**
 *  使用自定义的button 设置leftBtn
 *
 *  @param btn
 */
-(void)setLeftNavButton:(UIButton *)btn
{
    if(_leftBtn)
    {
        [_leftBtn removeFromSuperview];
        _leftBtn = nil;
    }
    _leftBtn = btn;
    if(_leftBtn)
    {
        [_leftBtn setFrame:CGRectMake(2, 15.0f, [[self class]BarBtnSize].width, [[self class]BarBtnSize].height )];
        [self addSubview:_leftBtn];
    }
}


-(void)setRightNavButton:(UIButton *)btn
{
    if(_rightBtn)
    {
        [_rightBtn removeFromSuperview];
        _rightBtn = nil;
    }
    _rightBtn = btn;
    if(_rightBtn)
    {
        [_rightBtn setFrame:CGRectMake([[self class] barSize].width - [[self class]BarBtnSize].width - 10, 20.0f, [[self class]BarBtnSize].width, [[self class]BarBtnSize].height)];
        [self addSubview:_rightBtn];
    }
}


-(void)setNavTitleLabel
{
    _titleLabel = [[UILabel alloc ]init];
    [_titleLabel setFrame:CGRectMake(60,  5, kScreenWidth-([[self class]BarBtnSize].width * 2), [[self class]barSize].height)];
//    [_titleLabel setFont:[UIFont systemFontOfSize:17.0]];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
}

- (void)setNavTitle:(NSString *)strTitle {
    if(!_titleLabel)
    {
        [self setNavTitleLabel];
    }
    [_titleLabel setText:strTitle];
    [self addSubview:_titleLabel];
}


-(void)setBackBtn
{
    UIButton *backBtn = [[UIButton alloc]init];
    [backBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self setLeftNavButton:backBtn];
}

-(void)backButtonClicked:(UIButton *)sender
{
    if(self.VC)
    {
        [self.VC dismissViewControllerAnimated:YES completion:nil];
        [self.VC.navigationController popViewControllerAnimated:YES];
    }
    
    
}

/**
 *使用自定义图片创建一个导航条按钮
 */
+ (UIButton *)createNavButtonByImageNormal:(NSString *)strNormal imageSelected:(NSString *)strSelected target:(id)target action:(SEL)action {
    UIImage *imageNormal = [UIImage imageNamed:strNormal];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:imageNormal forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:(strSelected ? strSelected : strNormal)] forState:UIControlStateSelected];
    
    CGFloat leftInset = ([[self class] BarBtnSize].width - imageNormal.size.width) / 2.0f;
    CGFloat topInset = ([[self class] BarBtnSize].height - imageNormal.size.height) / 2.0f;
    leftInset = (leftInset >= 2.0f) ? leftInset / 2.0f : 0.0f;
    topInset = (topInset >= 2.0f) ? topInset / 2.0f : 0.0f;
    [button setImageEdgeInsets:UIEdgeInsetsMake(topInset, leftInset, topInset, leftInset)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(topInset, -imageNormal.size.width, topInset, leftInset)];
    return button;
}

/**
 *使用title创建一个导航条按钮
 */
+ (UIButton *)createNavButttonByTitle:(NSString *)strTitle target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:strTitle forState:UIControlStateNormal];
    [button setTintColor:[UIColor blackColor]];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return button;
}



@end

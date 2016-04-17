//
//  XMGMineController.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGMineController.h"
#import "UIImage+resized.h"

#import "XMGSettingController.h"
#import <MessageUI/MessageUI.h>
@interface XMGMineController ()<MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate>
@end
@implementation XMGMineController
{
    UIImageView *_imageView;
    
    UILabel *_labelLogin;
    UIButton *_loginButton;
    UIButton *_registerButton;
    
    UIButton *_btnQQ;
    UIButton *_btnWeiXin;
    
    // 其他账号登录Label
    UILabel *_labelOther;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 创建子视图
    [self addChildView];
     
    // 调整子视图的约束
    [self updateChildViewContraints];
    
    // 添加导航栏按钮
    [self addNaviItem];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"我的";
}

- (void)addChildView
{
    // 1.创建imageView
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"LoginScreen"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    // 必须得设置为NO
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:imageView];

    _imageView = imageView;
    
    // 创建登录label
    UILabel *loginLabel = [[UILabel alloc]init];
    // 设置默认文字
    loginLabel.text = @"网易邮箱账号可直接登录";
    loginLabel.translatesAutoresizingMaskIntoConstraints = NO;
    loginLabel.font = [UIFont systemFontOfSize:12];
    loginLabel.textColor = [UIColor lightGrayColor];
    loginLabel.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:loginLabel];
    _labelLogin = loginLabel;
    
    // 创建登录Button
    UIButton *loginButton = [[UIButton alloc]init];
    // 设置默认文字
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(handleLoginBtnClick) forControlEvents:UIControlEventTouchDown];
    
    // 设置背景图片
    // 正常状态下的图片
    UIImage *normal = [UIImage imageNamed:@"RedButton"];
    normal = [normal resizeImage];
    
    UIImage *sel = [UIImage imageNamed:@"RedButtonPressed"];
    sel = [sel resizeImage];
    
    [loginButton setBackgroundImage:normal forState:UIControlStateNormal];
    // 高亮状态下地图片
    [loginButton setBackgroundImage:sel forState:UIControlStateHighlighted];
    loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:loginButton];
    _loginButton = loginButton;
    
    // 创建注册Button
    UIButton *registerButton = [[UIButton alloc]init];
    // 设置默认文字
    NSDictionary *dictAttribute = @{
                                    NSForegroundColorAttributeName :[UIColor blackColor],
                                    NSFontAttributeName :[UIFont systemFontOfSize:14]
                                    };
    NSString *str = @"没有账号?,马上注册>";
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:str attributes:dictAttribute];
    
    NSRange range = [str rangeOfString:@"马上注册>"];
    [attributeStr addAttributes:@{
                                 NSForegroundColorAttributeName :[UIColor blueColor],
                                 NSFontAttributeName :[UIFont systemFontOfSize:14]
                                 } range:range];
    
    [registerButton setAttributedTitle:attributeStr forState:UIControlStateNormal];
    registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 监听事件
    [registerButton addTarget:self action:@selector(handleRegisterBtnClick) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:registerButton];
    _registerButton = registerButton;
    
    // 创建QQ按钮
    UIButton *btnQQ = [self btnWithTitle:@"QQ"];
    _btnQQ = btnQQ;
    // 创建微信按钮
    UIButton *btnWeiXin = [self btnWithTitle:@"微信"];
    _btnWeiXin = btnWeiXin;
    
    // 创建使用账号登录Label
    UILabel *labelOther = [[UILabel alloc]init];
    labelOther.translatesAutoresizingMaskIntoConstraints = NO;
    labelOther.text = @"使用其他账号登录";
    labelOther.font = [UIFont systemFontOfSize:14];
    labelOther.textColor = [UIColor lightGrayColor];
    labelOther.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:labelOther];
    _labelOther = labelOther;
}

- (void)updateChildViewContraints
{
    // 1.调整imageView的约束
    NSDictionary *bind = NSDictionaryOfVariableBindings(self.view, _imageView,_labelLogin,_loginButton,_registerButton,_btnQQ,_btnWeiXin,_labelOther);
    // 水平方向的约束
    NSArray *arrayH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    // 垂直方向的约束
    NSArray *arrayV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_imageView(150)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    
    [self.view addConstraints:arrayH];
    [self.view addConstraints:arrayV];
    
    // 2.调整loginLabel的约束
    NSArray *arrayV1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_imageView]-0-[_labelLogin]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    // view1.attribute = view2.attribute * mulpler + constant;
    NSLayoutConstraint *contraintsCenterX = [NSLayoutConstraint constraintWithItem:_labelLogin attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    [self.view addConstraints:arrayV1];
    [self.view addConstraint:contraintsCenterX];
    
    // 3.调整登录按钮的约束
    // 水平方向的约束
    NSArray *arrayH3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[_loginButton]-25-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    // 垂直方向的约束
    NSArray *arrayV3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_labelLogin]-5-[_loginButton(35)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    
    [self.view addConstraints:arrayH3];
    [self.view addConstraints:arrayV3];
    
    
    // 4. 调整注册按钮的约束
    // 4.1垂直方向的约束
    NSArray *arrayV4 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_loginButton]-5-[_registerButton(30)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    // 4.2中心点的约束
    NSLayoutConstraint *contraintsCenterX1 = [NSLayoutConstraint constraintWithItem:_registerButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.view addConstraints:arrayV4];
    [self.view addConstraint:contraintsCenterX1];
    
    // 5.调整微信按钮的约束
    NSArray *arrayH5 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_btnWeiXin]-20-[_btnQQ(==_btnWeiXin)]-20-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    NSArray *arrayV5 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_btnWeiXin(30)]-50-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    // 4.2中心点的约束
    
    [self.view addConstraints:arrayH5];
    [self.view addConstraints:arrayV5];
    
    // 6.调整QQ按钮的约束
    NSArray *arrayV6 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_btnQQ(30)]-50-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    [self.view addConstraints:arrayV6];
    
    // 7. 调整labelOther的约束
    NSLayoutConstraint *contraintsCenterX2 = [NSLayoutConstraint constraintWithItem:_labelOther attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSArray *arrayV7 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_labelOther]-10-[_btnQQ]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:bind];
    // 4.2中心点的约束
    
    [self.view addConstraint:contraintsCenterX2];
    [self.view addConstraints:arrayV7];
}
- (void)addNaviItem
{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Mylottery_config"] style: UIBarButtonItemStylePlain target:self action:@selector(handleRightNaviItemClick)];
    self.navigationItem.rightBarButtonItem = right;
    
    UIButton *btnLeft = [[UIButton alloc]init];
    btnLeft.bounds = CGRectMake(0, 0, 60, 30);
    [btnLeft setTitle:@"客服" forState:UIControlStateNormal];
    
    btnLeft.titleLabel.font = [UIFont systemFontOfSize:14];
    btnLeft.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    [btnLeft setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    
    [btnLeft setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnLeft setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    // 添加监听事件
    [btnLeft addTarget:self action:@selector(handleKefuBtnClick) forControlEvents:UIControlEventTouchDown];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:btnLeft];
    
    
    // 创建间距按钮
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = -12;
    
    self.navigationItem.leftBarButtonItems = @[space, left];
    
}
// 私有方法 用来创建微信/QQ按钮
- (UIButton *)btnWithTitle:(NSString *)title
{
    UIButton *btn = [[UIButton alloc]init];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 普通状态下的背景图
    [btn setBackgroundImage:[UIImage imageNamed:@"whiteButton"] forState:UIControlStateNormal];
    // 高亮状态下地背景图
    [btn setBackgroundImage:[UIImage imageNamed:@"WhiteButtonPressed"] forState:UIControlStateHighlighted];
    
    // 设置按钮的文字颜色
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置默认文字
    [btn setTitle:title forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    return btn;
}

#pragma mark - 按钮的监听方法
- (void)handleLoginBtnClick
{
    NSLog(@"进入登录页面");
    /*
     
    // 发短信方法一
    // 进入发短信页面
    NSURL *url = [NSURL URLWithString:@"sms://10010"];
    if ([[UIApplication sharedApplication]canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
     
    */
    if (![MFMessageComposeViewController canSendText]) {
        return;
    }
    // 方法二
    MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc]init];
    // 发短信的内容
    vc.body = @"你吃饭了吗?";
    
    // 发短信的接收人
    vc.recipients = @[@"10010",@"10086"];
    
    vc.messageComposeDelegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)handleRegisterBtnClick
{
    NSLog(@"进入注册页面");
    
    NSURL *url = [NSURL URLWithString:@"WF://www.it520.com"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (void)handleRightNaviItemClick
{
    NSLog(@"右导航栏被点击");
    // 1.创建设置控制器
    XMGSettingController *setVc = [[XMGSettingController alloc]init];
    // 2.讲设置控制器push出来
    [self.navigationController pushViewController:setVc animated:YES];
}
- (void)handleKefuBtnClick
{
    UIViewController *kefu = [[UIViewController alloc]init];
    kefu.view.backgroundColor = [UIColor redColor];
//    kefu.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:kefu animated:YES];
}
#pragma mark - MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultSent) {
        NSLog(@"发送成功");
    }else if (result == MessageComposeResultFailed){
        NSLog(@"发送失败");
    }else if (result == MessageComposeResultCancelled){
        NSLog(@"用户取消发送");
    }
}
@end

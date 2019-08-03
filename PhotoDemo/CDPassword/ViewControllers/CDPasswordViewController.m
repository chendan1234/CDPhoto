

//
//  PasswordViewController.m
//  PhotoDemo
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright © 2019 陈丹. All rights reserved.
//

#import "CDPasswordViewController.h"
#import "CDSetPasswordView.h"
#import "CDSurePasswordView.h"
#import "CDPhotoPickerViewController.h"
#import "CDPhoto.h"


#define MarginX 20
#define MarginY 180
@interface CDPasswordViewController ()

@property (nonatomic, weak)UIView *passwordBgV;

@end

@implementation CDPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置UI
    [self setUI];
}


/**
 设置UI
 */
-(void)setUI{
    NSString *password = [[NSUserDefaults standardUserDefaults]objectForKey:K_PASSWORD];
    if(password.length){//有密码, 输入密码
        [self surePasswordUI];
    }else{//无密码, 设置密码
        [self setPasswordUI];
    }
}


/**
 设置密码UI
 */
-(void)setPasswordUI{
    
    self.title = @"设置密码";
    
    //设置self.passwordBgV
    CGFloat pswBgVH = 220;
    UIView *passwordBgV = [[UIView alloc]initWithFrame:CGRectMake(MarginX, -MarginY, DEVICE_WIDRH - 2*MarginX, pswBgVH)];
    self.passwordBgV = passwordBgV;
    
    //设置密码界面
    CDSetPasswordView *setPasswordV = [CDSetPasswordView reload];
    setPasswordV.frame = passwordBgV.bounds;
    [setPasswordV setMyBlock:^{
        [self presentPhotoPickerViewControllerWithStyle:CDShowImageTypeImagePicker];
        [self surePasswordUI];
    }];
    [self.passwordBgV addSubview:setPasswordV];
    
    //弹簧动画
    [UIView animateWithDuration:1.0 delay:0.5 usingSpringWithDamping:0.7 initialSpringVelocity:12 options:UIViewAnimationOptionCurveLinear animations:^{
        self.passwordBgV.y = MarginY;
    } completion:nil];
    
    [self.view addSubview:self.passwordBgV];
}

/**
 输入密码UI
 */
-(void)surePasswordUI{
    
    self.title = @"输入密码";
    
    //清空self.passwordBgV
    for (UIView *view in self.passwordBgV.subviews) {
        [view removeFromSuperview];
    }
    self.passwordBgV = nil;
    [self.passwordBgV removeFromSuperview];
    
    //重新加载self.passwordBgV
    CGFloat pswBgVH = 176;
    UIView *passwordBgV = [[UIView alloc]initWithFrame:CGRectMake(MarginX, -MarginY, DEVICE_WIDRH - 2*MarginX, pswBgVH)];
    self.passwordBgV = passwordBgV;
    
    //设置密码界面
    CDSurePasswordView *surePasswordV = [CDSurePasswordView reload];
    surePasswordV.frame = passwordBgV.bounds;
    [surePasswordV setMyBlock:^{
        [self presentPhotoPickerViewControllerWithStyle:CDShowImageTypeImagePicker];
    }];
    [passwordBgV addSubview:surePasswordV];
    
    //弹簧动画
    [UIView animateWithDuration:1.0 delay:0.5 usingSpringWithDamping:0.7 initialSpringVelocity:12 options:UIViewAnimationOptionCurveLinear animations:^{
        self.passwordBgV.y = MarginY;
    } completion:nil];
    
    [self.view addSubview:passwordBgV];
}


/**
 *  初始化相册选择器
 */
- (void)presentPhotoPickerViewControllerWithStyle:(CDShowImageType)style {
    CDPhotoPickerViewController *pickerVc = [[CDPhotoPickerViewController alloc] initWithShowType:style];
    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.title = @"相册";
    [self.navigationController pushViewController:pickerVc animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}





@end

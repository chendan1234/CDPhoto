

//
//  SetPasswordView.m
//  PhotoDemo
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright © 2019 陈丹. All rights reserved.
//

#import "CDSetPasswordView.h"

@interface CDSetPasswordView ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *setPswTF;
@property (weak, nonatomic) IBOutlet UITextField *surePswTF;

@end

@implementation CDSetPasswordView

+(instancetype)reload
{
    return [[[NSBundle mainBundle]loadNibNamed:@"CDSetPasswordView" owner:nil options:nil]lastObject];
}


/**
 点击确认
 */
- (IBAction)sureBtnClick:(id)sender {
    //校验
    if (self.setPswTF.text.length && self.surePswTF.text.length) {//有值
        if ([self.setPswTF.text isEqualToString:self.surePswTF.text]) {//且相等
            [self jumpToPhotoVC];//跳转
        }else{//不相等
            [[[UIAlertView alloc]initWithTitle:nil message:@"两次密码输入不一致, 请重新输入!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
        }
    }else{//无值
        [[[UIAlertView alloc]initWithTitle:nil message:@"密码不能为空!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
    }
    
}


/**
 校验成功, 跳转
 */
-(void)jumpToPhotoVC{
    
    //存密码
    [[NSUserDefaults standardUserDefaults] setObject:self.setPswTF.text forKey:K_PASSWORD];
    
    //跳转后, 改变界面, 适配返回键
    if (self.myBlock) {
        self.myBlock();
    }
    
}

#pragma ---------UIAlertViewDelegate----------
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    self.setPswTF.text = @"";
    self.surePswTF.text = @"";
    [self.setPswTF becomeFirstResponder];
}

@end

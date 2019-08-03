//



//  SurePasswordView.m
//  PhotoDemo
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright © 2019 陈丹. All rights reserved.
//

#import "CDSurePasswordView.h"

@interface CDSurePasswordView ()
@property (weak, nonatomic) IBOutlet UITextField *sureTF;

@end

@implementation CDSurePasswordView

+(instancetype)reload
{
    return [[[NSBundle mainBundle]loadNibNamed:@"CDSurePasswordView" owner:nil options:nil]lastObject];
}
- (IBAction)sureBtnClick:(id)sender {
    
    if (self.sureTF.text.length == 0) {
        [[[UIAlertView alloc]initWithTitle:nil message:@"请输入密码!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
        return;
    }
    
    if ([self.sureTF.text isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:K_PASSWORD]]) {
        //跳转相册界面
        if (self.myBlock) {
            self.myBlock();
        }
        self.sureTF.text = @"";
    }else{
        [[[UIAlertView alloc]initWithTitle:nil message:@"密码输入错误!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
        self.sureTF.text = @"";
    }
}



@end

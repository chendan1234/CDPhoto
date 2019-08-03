//
//  SetPasswordView.h
//  PhotoDemo
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright © 2019 陈丹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDSetPasswordView : UIView

+(instancetype)reload;

@property (nonatomic,copy) void(^myBlock)(void);

@end

NS_ASSUME_NONNULL_END

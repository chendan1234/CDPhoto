//
//  UIView+HMExtension.h
//  HuaMai
//
//  Created by 优加 on 16/8/22.
//  Copyright © 2016年 优加. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HMExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/

@end

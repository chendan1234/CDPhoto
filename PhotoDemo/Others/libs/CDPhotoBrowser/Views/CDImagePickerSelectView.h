//
//  CDImagePickerSelectView.h
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import <UIKit/UIKit.h>

@interface CDImagePickerSelectView : UIView

@property (nonatomic) UIButton *backBtn;
@property (nonatomic) UIButton *selectBtn;

- (void)addTarget:(id)target backAction:(SEL)backAction selectAction:(SEL)selectAction forControlEvents:(UIControlEvents)controlEvents;

@end

//
//  BQCameraView.h
//  carame
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 beiqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLCameraView;

@protocol ZLCameraViewDelegate <NSObject>

@optional
- (void)cameraDidSelected:(ZLCameraView *) camera;

@end

@interface ZLCameraView : UIView

@property (nonatomic, weak) id <ZLCameraViewDelegate> delegate;

@end

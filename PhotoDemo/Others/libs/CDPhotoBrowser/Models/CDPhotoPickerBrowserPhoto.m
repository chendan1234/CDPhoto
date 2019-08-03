//
//  PickerPhoto.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.
//

#import "CDPhotoPickerBrowserPhoto.h"

@implementation CDPhotoPickerBrowserPhoto


- (void)setPhotoObj:(id)photoObj {
    _photoObj = photoObj;
    
    if ([photoObj isKindOfClass:[CDPhotoAssets class]]) {
        CDPhotoAssets *asset = (CDPhotoAssets *)photoObj;
        self.asset = asset;
    } else if ([photoObj isKindOfClass:[NSURL class]]) {
        self.photoURL = photoObj;
    } else if ([photoObj isKindOfClass:[UIImage class]]) {
        self.photoImage = photoObj;
    } else if ([photoObj isKindOfClass:[NSString class]]) {
        self.photoPath = photoObj;
    } else {
        NSAssert(true == true, @"您传入的类型有问题");
    }
}

- (UIImage *)photoImage {
    if (!_photoImage && self.asset) {
        _photoImage = [self.asset originImage];
    }
    return _photoImage;
}

- (UIImage *)thumbImage {
    if (!_thumbImage) {
        if (self.asset) {
            _thumbImage = [self.asset thumbImage];
        } else if (_photoImage){
            _thumbImage = _photoImage;
        }
    }
    return _thumbImage;
}

#pragma mark - 传入一个图片对象，可以是URL/UIImage/NSString，返回一个实例
+ (instancetype)photoAnyImageObjWith:(id)imageObj {
    CDPhotoPickerBrowserPhoto *photo = [[self alloc] init];
    [photo setPhotoObj:imageObj];
    return photo;
}

- (instancetype)initWithAnyObj:(id)imageObj {
    if ((self = [super init])) {
        [self setPhotoObj:imageObj];
    }
    return self;
}

//此方法放在这里有点不合理，但是要迎合项目中原有的代码，暂时就放在这里。2015-10-17 L&G
- (void)loadImageFromFileAsync:(NSString *)path {
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfFile:path options:NSDataReadingUncached error:&error];
    if (!error) {
        self.photoImage = [[UIImage alloc] initWithData:data];
    } else {
        self.photoImage = nil;
    }
}

- (void)notifyImageDidStartLoad {
    dispatch_async(dispatch_get_main_queue(), ^{
        _isLoading = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:CDPhotoImageDidStartLoad object:self];
    });
}

- (void)notifyImageDidFinishLoad {
    dispatch_async(dispatch_get_main_queue(), ^{
        _isLoading = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:CDPhotoImageDidFinishLoad object:self];
    });
}

- (void)notifyImageDidFailLoadWithError:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        _isLoading = NO;
        NSDictionary *notifyInfo = [NSDictionary dictionaryWithObjectsAndKeys:error,@"error", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:CDPhotoImageDidFailLoadWithError object:self userInfo:notifyInfo];
    });
}

@end

//
//  CDPickerViewController.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#import "CDPhotoPickerViewController.h"
#import "NavigationViewController.h"
#import "CDPhoto.h"

@interface CDPhotoPickerViewController ()

@property (nonatomic , strong) CDPhotoPickerGroupViewController *groupVc;
//是否发送原图，1 原图 0 压缩过图
@property (nonatomic, assign) BOOL isOriginal;

@end

@implementation CDPhotoPickerViewController

- (instancetype)initWithShowType:(CDShowImageType)showType {
    self = [super init];
    if (self) {
        self.showType = showType;
        self.groupVc.showType = showType;
    }
    return self;
}

#pragma mark - Life cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addNotification];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.groupVc.delegate = nil;
}

#pragma mark - init Action
- (void) createNavigationController {
    _groupVc = [[CDPhotoPickerGroupViewController alloc] init];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:_groupVc];

    nav.view.frame = self.view.bounds;
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self createNavigationController];
    }
    return self;
}

- (void)setSelectPickers:(NSArray *)selectPickers {
    _selectPickers = selectPickers;
    self.groupVc.selectAsstes = [selectPickers mutableCopy];
}

- (void)setStatus:(PickerViewShowStatus)status {
    _status = status;
    self.groupVc.status = status;
}

- (void)setMaxCount:(NSInteger)maxCount {
    if (maxCount <= 0) return;
    _maxCount = maxCount;
    self.groupVc.maxCount = maxCount;
}

- (void)setNightMode:(BOOL)nightMode {
	_nightMode = nightMode;
	_groupVc.nightMode = nightMode;
}

- (void)setTopShowPhotoPicker:(BOOL)topShowPhotoPicker {
    _topShowPhotoPicker = topShowPhotoPicker;
    self.groupVc.topShowPhotoPicker = topShowPhotoPicker;
}

#pragma mark - 展示控制器
- (void)showPickerVc:(UIViewController *)vc {
    __weak typeof(vc)weakVc = vc;
    if (weakVc != nil) {
        [weakVc presentViewController:self animated:YES completion:nil];
    }
}

- (void) addNotification {
    // 监听异步done通知
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(done:) name:PICKER_TAKE_DONE object:nil];
    
    
}

#pragma mark - 监听点击Done按钮
- (void)done:(NSNotification *)note {
    NSArray *selectArray =  note.userInfo[@"selectAssets"];
    self.isOriginal = [note.userInfo[@"isOriginal"] boolValue];
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(pickerViewControllerDoneAsstes:isOriginal:)]) {
            [self.delegate pickerViewControllerDoneAsstes:selectArray  isOriginal:self.isOriginal];
        }else if (self.callBack){
            self.callBack(selectArray);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)setDelegate:(id<CDPhotoPickerViewControllerDelegate>)delegate {
    _delegate = delegate;
    self.groupVc.delegate = delegate;
}
@end

//
//  CDPhotoPickerGroupViewController.m
//  CDPhotoBrowser
//
//  Created by 陈丹 on 3/8/2019.
//  Copyright (c) 2019年 L&G. All rights reserved.

#define CELL_ROW 4
#define CELL_MARGIN 5
#define CELL_LINE_MARGIN 5


#import "CDPhotoPickerGroupViewController.h"
#import "CDPhotoPickerCollectionView.h"
#import "CDPhotoPickerDatas.h"
#import "CDPhotoPickerGroupViewController.h"
#import "CDPhotoPickerGroup.h"
#import "CDPhotoPickerGroupTableViewCell.h"
#import "CDPhotoPickerAssetsViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface CDPhotoPickerGroupViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) CDPhotoPickerAssetsViewController *collectionVc;

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, copy) NSArray *groups;
@property (nonatomic, copy) NSString *selectGroupURL;
@property (nonatomic, strong) CDPhotoPickerAssetsViewController *assetsVc;

@end

@implementation CDPhotoPickerGroupViewController

#pragma mark - dealloc

- (void)dealloc {
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

- (instancetype)initWithShowType:(CDShowImageType)showType {
    self = [super init];
    if (self) {
        self.showType = showType;
    }
    return self;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
        tableView.delegate = self;
        [tableView registerClass:[CDPhotoPickerGroupTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CDPhotoPickerGroupTableViewCell class])];
//        [self.view addSubview:tableView];
        self.tableView = tableView;
		self.tableView.frame = self.view.bounds;
		self.tableView.backgroundColor = [UIColor clearColor];
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择相册";
    // 设置按钮
    [self addNavBarCancelButton];
    
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied) {
        // 判断没有权限获取用户相册的话，就提示个View
        UIImageView *lockView = [[UIImageView alloc] init];
        lockView.image = [UIImage imageNamed:@"lock.png"];
        lockView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200);
        lockView.contentMode = UIViewContentModeCenter;
        [self.view addSubview:lockView];
        
        UILabel *lockLbl = [[UILabel alloc] init];
        lockLbl.text = PICKER_PowerBrowserPhotoLibirayText;
        lockLbl.numberOfLines = 0;
        lockLbl.textAlignment = NSTextAlignmentCenter;
        lockLbl.frame = CGRectMake(20, 0, self.view.frame.size.width - 40, self.view.frame.size.height);
        [self.view addSubview:lockLbl];
    } else {
//        [self tableView];
        // 获取图片
        [self getImgs];
    }
    
    self.tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);
}

#pragma mark - 创建右边取消按钮
- (void)addNavBarCancelButton {
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                             target:self
                             action:@selector(cancelBtnTouched)];
    self.navigationItem.rightBarButtonItem = temporaryBarButtonItem;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groups.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CDPhotoPickerGroupTableViewCell *cell = (CDPhotoPickerGroupTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CDPhotoPickerGroupTableViewCell class])];
	cell.backgroundColor = [UIColor colorWithWhite:1 alpha:.1f];
    
    if (cell == nil){
        cell = [[CDPhotoPickerGroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CDPhotoPickerGroupTableViewCell"];
    }
    cell.group = self.groups[indexPath.row];
    return cell;
    
}

#pragma mark -<UITableViewDelegate>

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CDPhotoPickerGroup *group = self.groups[indexPath.row];
    self.selectGroupURL = [[group.group valueForProperty:ALAssetsGroupPropertyURL] absoluteString];
    
    _assetsVc = [[CDPhotoPickerAssetsViewController alloc] init];
	__weak CDPhotoPickerGroupViewController *weakSelf = self;
    _assetsVc.selectedAssetsBlock = ^(NSMutableArray *selectedAssets){
        //回传选择的照片，实现选择记忆
        weakSelf.selectAsstes = selectedAssets;
    };
    _assetsVc.selectPickerAssets = self.selectAsstes;
    _assetsVc.assetsGroup = group;
    _assetsVc.topShowPhotoPicker = self.topShowPhotoPicker;
	_assetsVc.maxCount = self.maxCount;
	_assetsVc.nightMode = self.nightMode;
    [self.navigationController pushViewController:_assetsVc animated:YES];
}

#pragma mark -<Images Datas>

-(void)getImgs {
    CDPhotoPickerDatas *datas = [CDPhotoPickerDatas defaultPicker];
    __weak typeof(self) weakSelf = self;
    if (self.status == PickerViewShowStatusVideo){
        // 获取所有的图片URLs
        [datas getAllGroupWithVideos:^(NSArray *groups) {
            self.groups = [[groups reverseObjectEnumerator] allObjects];
            if (self.status) {
                [self gotoHistoryGroup];
            }
            weakSelf.tableView.dataSource = self;
            [weakSelf.tableView reloadData];
        }];
        
    }else{
        // 获取所有的图片URLs
        [datas getAllGroupWithPhotos:^(NSArray *groups) {
            self.groups = [[groups reverseObjectEnumerator] allObjects];
            if (self.status) {
                [self gotoHistoryGroup];
            }
            weakSelf.tableView.dataSource = self;
            [weakSelf.tableView reloadData];
        }];
    }
}

#pragma mark 从上次选择的组别进入相册选择器
- (void) gotoHistoryGroup {
    //这里可以使用单例或者文件本地化存储实现记忆功能
    
    //当前用以下方法代替组别记忆功能
    CDPhotoPickerGroup *gp = nil;
    for (CDPhotoPickerGroup *group in self.groups) {
        if ((self.status == PickerViewShowStatusCameraRoll || self.status == PickerViewShowStatusVideo) && ([group.groupName isEqualToString:@"Camera Roll"] || [group.groupName isEqualToString:@"相机胶卷"])) {
            gp = group;
            break;
        } else if (self.status == PickerViewShowStatusSavePhotos && ([group.groupName isEqualToString:@"Saved Photos"] || [group.groupName isEqualToString:@"保存相册"])){
            gp = group;
            break;
        } else if (self.status == PickerViewShowStatusPhotoStream &&  ([group.groupName isEqualToString:@"Stream"] || [group.groupName isEqualToString:@"我的照片流"])){
            gp = group;
            break;
        }
    }
    if (!gp) return ;
    [self setupAssetsVCWithGroup:gp];
}

- (void)setupAssetsVCWithGroup:(CDPhotoPickerGroup *)group {
    _assetsVc = [[CDPhotoPickerAssetsViewController alloc] initWithShowType:self.showType];
	__weak CDPhotoPickerGroupViewController *weakSelf = self;
	_assetsVc.selectedAssetsBlock = ^(NSMutableArray *selectedAssets){
        //回传选择的照片，实现选择记忆
        weakSelf.selectAsstes = [selectedAssets copy];
    };
    _assetsVc.selectPickerAssets = self.selectAsstes;
    _assetsVc.assetsGroup = group;
    _assetsVc.topShowPhotoPicker = self.topShowPhotoPicker;
    _assetsVc.maxCount = self.maxCount;
	_assetsVc.nightMode = self.nightMode;
    [self.navigationController pushViewController:_assetsVc animated:NO];
}

#pragma mark -<Navigation Actions>

- (void) cancelBtnTouched {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -<setters>

- (void)setNightMode:(BOOL)nightMode {
	_nightMode = nightMode;
	if (_assetsVc) {
		[_assetsVc setNightMode:nightMode];
	}
	if (nightMode == YES) {
		self.view.backgroundColor = NIGHTMODE_COLOR;
	} else {
		self.view.backgroundColor = DAYMODE_COLOR;
	}
}

@end

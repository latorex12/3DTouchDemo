//
//  ViewController.m
//  3DTouchRelated
//
//  Created by 梁天 on 16/9/28.
//  Copyright © 2016年 haibao. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController () <UIViewControllerPreviewingDelegate>
@property (nonatomic, assign) NSInteger numOfRow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numOfRow = 2;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCell)];
    self.navigationItem.rightBarButtonItem = item;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"axb"];
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (void)addCell {
    self.numOfRow ++;
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.numOfRow-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - PreView
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        return nil;
    }
    NewViewController *vc = [[NewViewController alloc]init];
    //preView的预设大小，如果0,0就是按照屏幕比例(旋转会不同),其他数值则是按照W/H比例放大
    vc.preferredContentSize = CGSizeMake(0, 0);
    vc.title = [NSString stringWithFormat:@"%zd",indexPath.row];
    vc.text = cell.textLabel.text;
    
    //forceTouch之后突出显示的地方
    previewingContext.sourceRect = cell.frame;
    
    return vc;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
}

#pragma mark - Delegate/DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"axb" forIndexPath:indexPath];
    if (indexPath.row <2) {
        cell.textLabel.text = @"吃饭呵呵去洗澡";
    }else {
        cell.textLabel.text = [NSDate date].description;
    }
    return cell;
}

@end

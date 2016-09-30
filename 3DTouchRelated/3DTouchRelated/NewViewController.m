//
//  NewViewController.m
//  3DTouchRelated
//
//  Created by 梁天 on 16/9/29.
//  Copyright © 2016年 haibao. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()
@property (nonatomic, strong) UILabel *textLbl;
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textLbl = [[UILabel alloc]initWithFrame:CGRectMake(40, 140, 200, 30)];
    self.textLbl.textColor = [UIColor redColor];
    self.textLbl.font = [UIFont boldSystemFontOfSize:16];
    self.textLbl.text = self.text;
    [self.view addSubview:self.textLbl];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *ac1 = [UIPreviewAction actionWithTitle:@"哈哈" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        self.textLbl.text = @"哈哈";
    }];
    UIPreviewAction *ac2 = [UIPreviewAction actionWithTitle:@"呵呵" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        self.textLbl.text = @"呵呵";
    }];
    UIPreviewAction *ac3 = [UIPreviewAction actionWithTitle:@"嘿嘿" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        self.textLbl.text = @"嘿嘿";
    }];
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"嘻嘻" style:UIPreviewActionStyleSelected actions:@[ac1,ac2,ac3]];
    return @[ac1,ac2,ac3,group];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"开始");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSLog(@"%f/%f",touch.force,touch.maximumPossibleForce);
    self.view.backgroundColor = [UIColor colorWithRed:touch.force/touch.maximumPossibleForce green:1-touch.force/touch.maximumPossibleForce blue:0 alpha:1];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"结束");
}


@end

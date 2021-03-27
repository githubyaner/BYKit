//
//  BYBaseViewController.m
//  BYKit
//
//  Created by SunShine.Rock on 16/4/26.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "BYBaseViewController.h"
#import "BYRequestManager.h"
#import "MBProgressHUD.h"

@interface BYBaseViewController ()

@end

@implementation BYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 *  添加loading
 */
- (void)addProgress {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中...";
}

/*
 *  删除loading
 */
- (void)deleteProgress {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

/*
 *  添加loading Of Navigation
 */
- (void)addProgressOfNavigation {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中...";
}

/*
 *  删除loading Of Navigation
 */
- (void)deleteProgressOfNavigation {
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

/*
 *  取消当前请求
 */
- (void)cancelRequest {
    NSAssert(self.requestManager, @"RequestManager is empty! You need to create or open space!");
    [self.requestManager.operation cancel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

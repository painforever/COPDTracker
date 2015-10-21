//
//  LoginViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/21/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login_action:(id)sender {
    UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
    AppDelegate *ddd = [UIApplication sharedApplication].delegate;
    [ddd.window setRootViewController: tabBarController];
}

- (IBAction)signup_action:(id)sender {
}
@end

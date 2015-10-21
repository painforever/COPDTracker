//
//  LoginViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/21/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login_action:(id)sender;

- (IBAction)signup_action:(id)sender;
@end

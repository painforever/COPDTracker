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
    [[AFNetwork getAFManager] POST:[SERVER_URL stringByAppendingString:@"sessions"] parameters:@{@"email": self.email.text, @"password": self.password.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *user = (NSDictionary *)responseObject;
        NSLog(@"asasa %@", [responseObject description]);
        if (user != [NSNull null]) {
            //userDefault list:
            //1, patient_id
            //2, user_id
            //3, all drugs
            //4, all administration methods
            //5, all side effects, for default
            userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setValue:user[@"user_id"] forKey:@"user_id"];
            [userDefaults setValue:user[@"patient_id"] forKey:@"patient_id"];
            [userDefaults setObject:@[@"Advair", @"albuterol", @"Asmanex",@"Atrovent",@"Breo Ellipta",@"budesonide",@"Chantix",@"Combivent",@"Daliresp",@"Flovent",@"fluticasone",@"Foradil", @"levalbuterol", @"Prednisone", @"ProAir", @"Proventil HFA", @"Pulmicort", @"QVAR", @"serevent", @"Spiriva", @"Symbicort", @"Theophylline", @"xopenex", @"Zyban"] forKey:@"copd_drugs"];
            [userDefaults setObject:@[@"ORAL",@"INJECTION",@"INTRAVENOUS",@"PARENTERAL",@"SUBCUTANEOUS",@"INHALATION", @"TOPICAL", @"TAPE",@"INTRAMUSCULAR INJECTION", @"INTRA-ARTICULAR INJECTION", @"INTRALESIONAL INJECTION", @"RECTAL"] forKey:@"administration_methods"];
            
            [userDefaults setObject:@[@"drizzle", @"vomit", @"Headache", @"Insomia", @"diarrhea", @"fever"] forKey:@"side_effects"];
            //redirect
            UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
            AppDelegate *ddd = [UIApplication sharedApplication].delegate;
            [ddd.window setRootViewController: tabBarController];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self showAlert:@"Account info wrong." withMessage:@"Your username or password is wrong!"];
        return;
    }];
}

- (IBAction)signup_action:(id)sender {
}
@end

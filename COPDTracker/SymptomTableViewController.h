//
//  SymptomTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SymptomTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *exertional_breathlessness_switcher;
@property (weak, nonatomic) IBOutlet UISwitch *chronic_cough_switcher;
@property (weak, nonatomic) IBOutlet UISwitch *regular_sputum_production_switcher;
@property (weak, nonatomic) IBOutlet UISwitch *frequent_winter_bronchitis_switcher;
@property (weak, nonatomic) IBOutlet UISwitch *wheeze_switcher;

- (IBAction)submitButtonAction:(id)sender;
@end

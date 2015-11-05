//
//  RespirationTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewConditionReportTableViewController.h"
#import "Manifest.h"

@class NewConditionReportTableViewController;

@interface RespirationTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *smoke_today_switcher;
@property (weak, nonatomic) IBOutlet UITextField *smoke_today_howmuch;

@property (weak, nonatomic) IBOutlet UISwitch *secondhand_smoke_switcher;
@property (weak, nonatomic) IBOutlet UITextField *secondhand_smoke_howlong;

@property (weak, nonatomic) IBOutlet UISwitch *stayin_bad_air_switcher;
@property (weak, nonatomic) IBOutlet UITextField *bad_air_list;

@property (weak, nonatomic) NewConditionReportTableViewController *parent;


- (IBAction)submitAction:(id)sender;


@end

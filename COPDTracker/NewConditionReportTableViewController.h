//
//  NewConditionReportTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RespirationTableViewController.h"
#import "SymptomTableViewController.h"
#import "Manifest.h"

@class SymptomTableViewController;
@class RespirationTableViewController;

@interface NewConditionReportTableViewController : UITableViewController
@property (strong, nonatomic) RespirationTableViewController *respirationViewController;
@property (strong, nonatomic) SymptomTableViewController *symptomViewController;

@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UILabel *respiration_label;
@property (weak, nonatomic) IBOutlet UILabel *symptom_label;
@property (weak, nonatomic) IBOutlet UITextField *medication_for_today;

//respiration and symptom
@property (strong, nonatomic) NSMutableDictionary *respiration_hash;
@property (strong, nonatomic) NSMutableDictionary *symptom_hash;

- (IBAction)submitAction:(id)sender;
@end

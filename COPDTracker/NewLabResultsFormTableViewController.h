//
//  NewLabResultsFormTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabTypesTableViewController.h"
#import "Manifest.h"

@class LabTypesTableViewController;

@interface NewLabResultsFormTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *testDate;
@property (weak, nonatomic) IBOutlet UITextField *testResult;
@property (weak, nonatomic) IBOutlet UITextField *labType;

@property (strong, nonatomic) LabTypesTableViewController *typesViewController;
- (IBAction)save_action:(id)sender;
@end

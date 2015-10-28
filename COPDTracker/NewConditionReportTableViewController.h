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

@interface NewConditionReportTableViewController : UITableViewController
@property (strong, nonatomic) RespirationTableViewController *respirationViewController;
@property (strong, nonatomic) SymptomTableViewController *symptomViewController;
@end

//
//  ConditionReportTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConditionReportCell.h"
#import "NewConditionReportTableViewController.h"

@interface ConditionReportTableViewController : UITableViewController
@property (strong, nonatomic) NewConditionReportTableViewController *addConditionReportViewController;
- (IBAction)addButtonAction:(id)sender;

@end

//
//  MedHistorySelectionViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MedicalHistoryTableViewController.h"
#import "AdverseEventTableViewController.h"

@interface MedHistorySelectionViewController : UIViewController
@property (weak, nonatomic) MedicalHistoryTableViewController *historyTableView;
@property (weak, nonatomic) AdverseEventTableViewController *adverseEventTableView;

- (IBAction)adverseEventReportbuttonAction:(id)sender;
- (IBAction)myMedicationButtonAction:(id)sender;

@end

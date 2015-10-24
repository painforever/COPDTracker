//
//  MedicalHistoryTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMedicationTableViewController.h"

@interface MedicalHistoryTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addMedicationButton;
- (IBAction)addMedicationButtonAction:(id)sender;
@end

//
//  AddMedicationTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMedicationTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *med_name_textfield;
@property (strong, nonatomic) IBOutlet UITextField *start_date_textfield;
@property (weak, nonatomic) IBOutlet UITextField *end_date_textfield;
@property (weak, nonatomic) IBOutlet UILabel *dosage_result_label;
@property (weak, nonatomic) IBOutlet UITextField *administration_method_textfield;
@property (weak, nonatomic) IBOutlet UILabel *schedule_result_label;

@end

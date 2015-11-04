//
//  AddMedicationTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DosageTableViewController.h"
#import "ScheduleTableViewController.h"
#import "UIViewController+SharedUIMethods.h"

@class DosageTableViewController;
@class ScheduleTableViewController;

@interface AddMedicationTableViewController : UITableViewController<UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *med_name_textfield;
@property (strong, nonatomic) IBOutlet UITextField *start_date_textfield;
@property (weak, nonatomic) IBOutlet UITextField *end_date_textfield;
@property (weak, nonatomic) IBOutlet UILabel *dosage_result_label;
@property (weak, nonatomic) IBOutlet UITextField *administration_method_textfield;
@property (weak, nonatomic) IBOutlet UILabel *schedule_result_label;

//dosage and schedule
@property (strong, nonatomic) NSString *amount;
@property (strong, nonatomic) NSString *unit_of_measure;
@property (strong, nonatomic) NSString *scheduled_time;
@property (strong, nonatomic) NSString *repeat_times;

//2 views, dosage and schedule
@property (strong, nonatomic) DosageTableViewController *dosageTableView;
@property (strong, nonatomic) ScheduleTableViewController *scheduleTableView;
- (IBAction)saveAction:(id)sender;
@end

//
//  ScheduleTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/26/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMedicationTableViewController.h"
#import "Manifest.h"

@class AddMedicationTableViewController;

@interface ScheduleTableViewController : UITableViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *schedule;
@property (weak, nonatomic) IBOutlet UITextField *repeat;
@property (weak, nonatomic) UIPickerView *schedulePicker;

@property (strong, nonatomic) NSDictionary *date_enum;

//parent
@property (weak, nonatomic) AddMedicationTableViewController *parent;

- (IBAction)submitAction:(id)sender;
@end

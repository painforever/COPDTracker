//
//  DosageTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/26/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMedicationTableViewController.h"
#import "Manifest.h"

@class AddMedicationTableViewController;

@interface DosageTableViewController : UITableViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UITextField *unit_of_measure;
- (IBAction)submitAction:(id)sender;

@property (strong, nonatomic) UIPickerView *unit_measure_picker;
@property (strong, nonatomic) NSArray *unit_of_measure_enum;

//parent
@property (weak, nonatomic) AddMedicationTableViewController *parent;
@end

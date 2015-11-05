//
//  NewExacerbationTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/29/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExcerbationTypesTable.h"
#import "Manifest.h"

@class ExcerbationTypesTable;

@interface NewExacerbationTableViewController : UITableViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *start_date;
@property (weak, nonatomic) IBOutlet UITextField *end_date;
@property (weak, nonatomic) IBOutlet UITextField *symptom;
@property (weak, nonatomic) IBOutlet UITextField *intensity;
- (IBAction)submitAction:(id)sender;



@property (strong, nonatomic) ExcerbationTypesTable *excerbationTypes;
@end

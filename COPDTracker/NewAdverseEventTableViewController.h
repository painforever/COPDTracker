//
//  NewAdverseEventTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manifest.h"

@interface NewAdverseEventTableViewController : UITableViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIActionSheetDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *eventName;
@property (strong, nonatomic) IBOutlet UITextField *relatedDrug;
@property (strong, nonatomic) IBOutlet UITextField *notes;
@property (strong, nonatomic) IBOutlet UITextField *date;
@property (strong, nonatomic) UIActionSheet *actionSheet;

@property (strong, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)submitButtonAction:(id)sender;
@end

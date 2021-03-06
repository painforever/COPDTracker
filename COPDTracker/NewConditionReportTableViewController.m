//
//  NewConditionReportTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "NewConditionReportTableViewController.h"

@interface NewConditionReportTableViewController ()
{
    UIDatePicker *datePicker;
}
@end

@implementation NewConditionReportTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControls];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual: self.date])
        self.date.text = [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"lalala %@", [self.respiration_hash description]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        self.respirationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RespirationTableViewController"];
        self.respirationViewController.parent = self;
        [self.navigationController pushViewController:self.respirationViewController animated:YES];
    }
    if (indexPath.row == 2) {
        self.symptomViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SymptomTableViewController"];
        self.symptomViewController.parent = self;
        [self.navigationController pushViewController:self.symptomViewController animated:YES];
    }
}

- (IBAction)submitAction:(id)sender {
    if (![self globallyValidateUserInputs:@[self.date, self.medication_for_today]]) return;
    if ([self.respiration_label.text isEqualToString:@"no results"] || [self.symptom_label.text isEqualToString:@"no results"]) {
        [self showAlert:@"Respirations and Symptoms" withMessage:@"You have no settle the Respiration and Symptoms for today!"];
        return;
    }
    [[AFNetwork getAFManager] POST:[SERVER_URL stringByAppendingString:@"patient_reported_conditions"] parameters:@{@"prc": @{@"patient_id": [userDefaults valueForKey:@"patient_id"], @"date_reported": self.date.text, @"condition_description": [JSONHandler NSDictionaryToJSON: @{@"respiration": self.respiration_hash, @"symptom": self.symptom_hash}]}} success:^(AFHTTPRequestOperation * operation, id responseObject) {
        [self showAlert:@"Success" withMessage:@"Condition add success!"];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)setUpControls{
    self.date.delegate = self;
    datePicker = [[UIDatePicker alloc] init];
    [datePicker addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
    [self buildDateTimePickerView:datePicker withNSDate:[NSDate date] withUITextField:self.date withDatePickerMode:UIDatePickerModeDateAndTime];
}

-(void)updateDate: (id)sender{
    self.date.text = [NSString stringWithFormat:@"%@", [(UIDatePicker *)self.date.inputView date]];
}
@end

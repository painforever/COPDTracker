//
//  AddMedicationTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "AddMedicationTableViewController.h"

@interface AddMedicationTableViewController ()
{
    UIDatePicker *start_date_picker;
    UIDatePicker *end_date_picker;
    UIPickerView *med_picker_view;
    UIPickerView *route_name_picker;
}
@end

@implementation AddMedicationTableViewController
@synthesize dosageTableView;
@synthesize scheduleTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControls];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        dosageTableView = [self.storyboard instantiateViewControllerWithIdentifier:@"DosageTableViewController"];
        dosageTableView.parent = self;
        [self.navigationController pushViewController:dosageTableView animated:YES];
    }
    else if (indexPath.row == 5){
        scheduleTableView = [self.storyboard instantiateViewControllerWithIdentifier:@"ScheduleTableViewController"];
        scheduleTableView.parent = self;
        [self.navigationController pushViewController:scheduleTableView animated:YES];
    }
}
- (IBAction)saveAction:(id)sender {
    if (![self globallyValidateUserInputs:@[self.med_name_textfield, self.start_date_textfield, self.end_date_textfield, self.administration_method_textfield]]) {
        return;
    }
    //construct the parameters
    [[AFNetwork getAFManager] POST:[SERVER_URL stringByAppendingString:@"rxs"] parameters:@{@"prm": @{@"patient_id": [userDefaults valueForKey:@"patient_id"], @"prescribed_date" : self.start_date_textfield.text, @"end_date": self.end_date_textfield.text, @"dosage": self.amount, @"dosage_unit": self.unit_of_measure, @"route_name": self.administration_method_textfield.text}} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self showAlert:@"Success" withMessage:@"Add success!"];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"failed.");
    }];
}

#pragma text fields delegates
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual:self.start_date_textfield] || [textField isEqual: self.end_date_textfield]){
        if ([[self trim:textField.text] length] == 0)
            textField.text = [NSString stringWithFormat:@"%@", [NSDate date]];
    }
    
    if ([textField isEqual:self.med_name_textfield])
        self.med_name_textfield.text = [userDefaults valueForKey:@"copd_drugs"][0];
    if ([textField isEqual: self.administration_method_textfield])
        self.administration_method_textfield.text = @"ORAL";
}

-(void)updateStartDate: (id)sender{
    self.start_date_textfield.text = [NSString stringWithFormat:@"%@", [(UIDatePicker *)self.start_date_textfield.inputView date]];
}

-(void)updateEndDate: (id)sender{
    self.end_date_textfield.text = [NSString stringWithFormat:@"%@", [(UIDatePicker *)self.end_date_textfield.inputView date]];
}

//set up all controls including dropdown list
-(void)setUpControls{
    self.start_date_textfield.delegate = self;
    self.end_date_textfield.delegate = self;
    self.med_name_textfield.delegate = self;
    self.administration_method_textfield.delegate = self;
    //start date
    start_date_picker = [[UIDatePicker alloc] init];
    [start_date_picker addTarget:self action:@selector(updateStartDate:) forControlEvents:UIControlEventValueChanged];
    [self buildDateTimePickerView:start_date_picker withNSDate:[NSDate date] withUITextField:self.start_date_textfield withDatePickerMode:UIDatePickerModeDateAndTime];
    
    //end date
    end_date_picker = [[UIDatePicker alloc] init];
    [end_date_picker addTarget:self action:@selector(updateEndDate:) forControlEvents:UIControlEventValueChanged];
    [self buildDateTimePickerView:end_date_picker withNSDate:[NSDate date] withUITextField:self.end_date_textfield withDatePickerMode:UIDatePickerModeDateAndTime];
    
    //med picker view
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [self buildCustomPickerView:med_picker_view withArray:nil withUITextField:self.med_name_textfield withDoneButton:doneBtn];
    
    //route name picker view
    UIBarButtonItem *doneBtnRouteName = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(routeNameDoneClicked)];
    [self buildCustomPickerView:route_name_picker withArray:nil withUITextField:self.administration_method_textfield withDoneButton:doneBtnRouteName];
}

#pragma custom picker views
-(void)pickerDoneClicked{
    NSLog(@"Done Clicked");
    [self.med_name_textfield resignFirstResponder];
    med_picker_view.hidden=YES;
}

-(void)routeNameDoneClicked{
    [self.administration_method_textfield resignFirstResponder];
    route_name_picker.hidden = YES;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ([pickerView isEqual: med_picker_view])
        return [[userDefaults valueForKey:@"copd_drugs"] count];
    else
        return [[userDefaults valueForKey:@"administration_methods"] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if ([pickerView isEqual: med_picker_view])
        return [[userDefaults valueForKey:@"copd_drugs"] objectAtIndex:row];
    else return [[userDefaults valueForKey:@"administration_methods"] objectAtIndex:row];
    
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if ([pickerView isEqual:med_picker_view])
        self.med_name_textfield.text = [[userDefaults valueForKey:@"copd_drugs"] objectAtIndex:row];
    else self.administration_method_textfield.text = [[userDefaults valueForKey:@"administration_methods"] objectAtIndex:row];
}
@end

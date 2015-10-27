//
//  DosageTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/26/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "DosageTableViewController.h"

@interface DosageTableViewController ()

@end

@implementation DosageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.unit_of_measure_enum = @[@"mg", @"mcg", @"mL", @"mg/m2", @"Units", @"Puff", @"Inhalation", @"cc", @"g", @"mg/kg", @"Cycle/s", @"Drops", @"mg/mL"];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [self buildCustomPickerView:self.unit_measure_picker withArray:self.unit_of_measure_enum withUITextField:self.unit_of_measure withDoneButton:doneBtn];
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
    return 3;
}

#pragma UIPickerView

-(void)pickerDoneClicked{
    NSLog(@"Done Clicked");
    [self.unit_of_measure resignFirstResponder];
    //mypickerToolbar.hidden=YES;
    self.unit_measure_picker.hidden=YES;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.unit_of_measure_enum count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.unit_of_measure_enum objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.unit_of_measure.text = [self.unit_of_measure_enum objectAtIndex:row];
}
- (IBAction)submitAction:(id)sender {
    self.parent.dosage_result_label.text = [NSString stringWithFormat:@"%@ %@", self.amount.text, self.unit_of_measure.text];
    self.parent.amount = self.amount.text;
    self.parent.unit_of_measure = self.unit_of_measure.text;
    [self.navigationController popViewControllerAnimated:YES];
}
@end

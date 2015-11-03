//
//  AddMedicationTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "AddMedicationTableViewController.h"

@interface AddMedicationTableViewController ()
@end

@implementation AddMedicationTableViewController
@synthesize dosageTableView;
@synthesize scheduleTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
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
@end

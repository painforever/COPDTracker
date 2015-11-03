//
//  MedHistorySelectionViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/23/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "MedHistorySelectionViewController.h"

@interface MedHistorySelectionViewController ()
@end

@implementation MedHistorySelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)adverseEventReportbuttonAction:(id)sender {
    if (self.adverseEventTableView == nil) {
        self.adverseEventTableView =[self.storyboard instantiateViewControllerWithIdentifier:@"AdverseEventTableViewController"];
    }
    [self.navigationController pushViewController:self.adverseEventTableView animated:YES];
}

- (IBAction)myMedicationButtonAction:(id)sender {
    if (self.historyTableView == nil) {
        self.historyTableView = [self.storyboard instantiateViewControllerWithIdentifier:@"MedicalHistoryTableViewController"];
    }
    [self.navigationController pushViewController:self.historyTableView animated:YES];
}
@end

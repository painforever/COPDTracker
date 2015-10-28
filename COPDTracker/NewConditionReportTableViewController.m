//
//  NewConditionReportTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "NewConditionReportTableViewController.h"

@interface NewConditionReportTableViewController ()

@end

@implementation NewConditionReportTableViewController

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
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        self.respirationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RespirationTableViewController"];
        [self.navigationController pushViewController:self.respirationViewController animated:YES];
    }
    if (indexPath.row == 2) {
        self.symptomViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SymptomTableViewController"];
        [self.navigationController pushViewController:self.symptomViewController animated:YES];
    }
}

@end

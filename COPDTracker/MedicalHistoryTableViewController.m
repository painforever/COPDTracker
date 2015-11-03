//
//  MedicalHistoryTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "MedicalHistoryTableViewController.h"

@interface MedicalHistoryTableViewController ()
{
    AddMedicationTableViewController *addMedicationForm;
    NSMutableArray *table_data;
}

@end

@implementation MedicalHistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AFNetwork getAFManager] GET:[SERVER_URL stringByAppendingString:@"rxs"] parameters:@{@"patient_id": [userDefaults valueForKey:@"patient_id"]} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        table_data = (NSMutableArray *)responseObject;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return table_data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MedHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dic = [table_data objectAtIndex: indexPath.row];
    cell.drug_name.text = dic[@"drug_name"];
//    cell.dosage.text = [NSString stringWithFormat:@"dosage: %@", dic[@"dosage"]];
//    cell.start_date.text = [NSString stringWithFormat:@"start: %@", dic[@"start_date"]];
//    cell.end_date.text = [NSString stringWithFormat:@"end: %@", dic[@"end_date"]];
//    cell.route_name.text = [NSString stringWithFormat:@"route name: %@", dic[@"route_name"]];
    
    cell.dosage.text = [self showNullIfNullWithPrefix:dic[@"dosage"] withPrefix: @"dosage:"];
    cell.start_date.text = [self showNullIfNullWithPrefix:dic[@"start_date"] withPrefix:@"start:"];
    cell.end_date.text = [self showNullIfNullWithPrefix:dic[@"end_date"] withPrefix:@"end:"];
    cell.route_name.text = [self showNullIfNullWithPrefix:dic[@"route_name"] withPrefix:@"route name:"];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addMedicationButtonAction:(id)sender {
    addMedicationForm = [self.storyboard instantiateViewControllerWithIdentifier:@"AddMedicationTableViewController"];
    [self.navigationController pushViewController:addMedicationForm animated:YES];
}
@end

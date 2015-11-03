//
//  LabResultsTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "LabResultsTableViewController.h"

@interface LabResultsTableViewController ()
{
    NewLabResultsFormTableViewController *newLabForm;
    NSMutableArray *table_data;
}
@end

@implementation LabResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AFNetwork getAFManager] GET:[SERVER_URL stringByAppendingString:@"labresults"] parameters:@{@"patient_id": [userDefaults valueForKey:@"patient_id"]} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        table_data = (NSMutableArray *)responseObject;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"failed to load data");
    }];
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
    return table_data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LabResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dic = [table_data objectAtIndex:indexPath.row];
    cell.test_date.text = [NSString stringWithFormat:@"Date: %@", dic[@"test_date"]];
    cell.test_type.text = [NSString stringWithFormat:@"Type: %@", dic[@"test_type"]];
    cell.result.text = [NSString stringWithFormat:@"Result: %@", dic[@"result"]];
    cell.unit.text = [NSString stringWithFormat:@"unit: %@", dic[@"units"]];
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

- (IBAction)addNewLabButtonAction:(id)sender {
    newLabForm = [self.storyboard instantiateViewControllerWithIdentifier:@"NewLabResultsFormTableViewController"];
    [self.navigationController pushViewController:newLabForm animated:YES];
}
@end
